import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/device_cubit.dart';
import '../cubit/device_state.dart';
import '../widgets/device_grid.dart';
import '../widgets/home_header.dart';
import '../widgets/home_status_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DeviceCubit, DeviceState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),

                  const SizedBox(height: 24),

                  HomeStatusCard(
                    activeCount: state.activeDeviceCount,
                    totalCount: state.totalDeviceCount,
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'My Devices',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  DeviceGrid(
                    devices: state.devices,
                    onDeviceToggle: (id) {
                      context.read<DeviceCubit>().toggleDevice(id);
                    },
                  ),

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        context.read<DeviceCubit>().turnAllOff();
                      },
                      icon: const Icon(Icons.power_settings_new),
                      label: const Text('Turn All Devices Off'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
