#!/bin/bash
/generate.neutron.conf
/generate.linuxbridge_agent.ini
neutron-api --port 9696
