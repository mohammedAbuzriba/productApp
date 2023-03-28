import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home_page/cubit/home_cubit.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class Number extends StatelessWidget {
  const Number({super.key});
  @override
  Widget build(BuildContext context) {
    print('-----------------Number 1------------------');

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.num1 != current.num1,
      builder: (context, state) {
        print('-----------------BlocBuilder Number 1------------------');
        return CustomText(text: state.num1.toString());
      },
    );
  }
}

class Number2 extends StatelessWidget {
  const Number2({super.key});
  @override
  Widget build(BuildContext context) {
    print('-----------------Number 2------------------');

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.num2 != current.num2,
      builder: (context, state) {
        print('-----------------BlocBuilder Number 2------------------');
        return CustomText(text: state.num2.toString());
      },
    );
  }
}

class Number3 extends StatelessWidget {
  const Number3({super.key});
  @override
  Widget build(BuildContext context) {
    print('-----------------Number 3------------------');

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.num3 != current.num3,
      builder: (context, state) {
        print('-----------------BlocBuilder Number 3------------------');
        return CustomText(text: state.num3.toString());
      },
    );
  }
}

class ButtonOne extends StatelessWidget {
  const ButtonOne({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: CustomButton(
            textButton: 'Click ButtonOne !',
            onTap: () {
              context
                  .read<HomeCubit>()
                  .num1onChange('${int.parse(state.num1.toString()) + 1}');
            },
          ),
        );
      },
    );
  }
}

class ButtonTwo extends StatelessWidget {
  const ButtonTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: CustomButton(
            textButton: 'Click ButtonTwo !',
            onTap: () {
              context
                  .read<HomeCubit>()
                  .num2onChange('${int.parse(state.num2.toString()) + 1}');
            },
          ),
        );
      },
    );
  }
}

class ButtonThree extends StatelessWidget {
  const ButtonThree({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: CustomButton(
            textButton: 'Click ButtonThree !',
            onTap: () {
              context
                  .read<HomeCubit>()
                  .num3onChange('${int.parse(state.num3.toString()) + 1}');
            },
          ),
        );
      },
    );
  }
}

class ButtonReset extends StatelessWidget {
  const ButtonReset({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: CustomButton(
            textButton: 'Click to Reset !',
            onTap: () {
              context.read<HomeCubit>().num1onChange('0');
              context.read<HomeCubit>().num2onChange('0');
              context.read<HomeCubit>().num3onChange('0');
            },
          ),
        );
      },
    );
  }
}

class ButtonGetDataFromApi extends StatelessWidget {
  const ButtonGetDataFromApi({super.key});
  @override
  Widget build(BuildContext context) {
    print('---------3------------');
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: CustomButton(
            textButton: 'Click to Get Data From Api !',
            onTap: () {
              print('---------4------------');
              context.read<HomeCubit>().getUserApi();
            },
          ),
        );
      },
    );
  }
}
