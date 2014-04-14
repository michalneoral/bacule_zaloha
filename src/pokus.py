#!/usr/bin/env python
"""program for collecting data, only menu"""
import roslib; roslib.load_manifest('clopema_smach')
import rospy, smach, smach_ros, math, copy, tf, PyKDL, os, shutil, numpy, time, subprocess
from _bag_files_hydro import stop_bag_file, start_bag_file_camera_def, start_bag_file_topic
import rospy, smach, smach_ros, math, copy, tf, PyKDL, os, shutil, numpy
from tf.transformations import quaternion_from_euler, quaternion_about_axis
from tf_conversions import posemath
from clopema_smach import *
from clopema_motoros.srv import *
from geometry_msgs.msg import *
from smach import State, Sequence
from clopema_smach.msg import MA1400JointState
from clopema_smach.utility_states import PoseBufferState
from sensor_msgs.msg import JointState
import _pos
from actions import remove_middle_points

def PokusnyPohyb(pos=0, m_pos=0, name = 'move_measure'):
    sm = smach.Sequence(outcomes=['succeeded', 'preempted', 'aborted'], connector_outcome='succeeded')

    sm.userdata.goals = []
    sm.userdata.goals.append(copy.deepcopy(_pos.get_joints_r2(pos, m_pos)))
    sm.userdata.goals.append(copy.deepcopy(_pos.get_joints_r2_m(pos, m_pos)))
    sm.userdata.robot = 2
    sm.userdata.density = 1000 #large number means there is only first point
    sm.userdata.middle_points = 5 #number of the points in the middle of the trajectory (pause)
    sm.userdata.end_points = 20 #number of the points at the end of the trajectory - to prevent early stop

    with sm:
        smach.Sequence.add('INTERPOLATE', Interpolate1JointsState())
        smach.Sequence.add('REMOVE_MIDDLE_POINTS', FunctionApplicationState(remove_middle_points, input_keys=['trajectory', 'density', 'middle_points', 'end_points'], output_keys=['trajectory']))
        smach.Sequence.add('EXECUTE', TrajectoryExecuteState())
        #smach.Sequence.add('POWER_OFF', SetServoPowerOffState())

    sis = smach_ros.IntrospectionServer(name, sm, '/SM_ROOT')
    sis.start()
    outcome = sm.execute()
    sis.stop()

def main():
    rospy.init_node('pokus')
    PokusnyPohyb(1,0)    

if __name__ == '__main__':
    main()
