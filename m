Return-Path: virtio-comment-return-1886-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7DA5A9862E4
	for <virtio-comment@lists.oasis-open.org>; Mon,  7 Jun 2021 05:45:57 +0000 (UTC)
Date: Mon, 7 Jun 2021 11:15:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20210607054553.7bjuiol44efr7dwz@vireshk-i7>
References: <e687cd6bdafe1ad13205d99989163299649e20c9.1622794175.git.viresh.kumar@linaro.org>
 <db7ad3b4-36b5-1988-8f9a-b50a7e820150@metux.net>
MIME-Version: 1.0
In-Reply-To: <db7ad3b4-36b5-1988-8f9a-b50a7e820150@metux.net>
Subject: Re: [virtio-comment] [PATCH V2] virtio-gpio: add the device
 specification
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: virtio-comment@lists.oasis-open.org, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 04-06-21, 14:25, Enrico Weigelt, metux IT consult wrote:
> On 04.06.21 10:09, Viresh Kumar wrote:
> > +The \field{VIRTIO_GPIO_REQ_GET_DIRECTION} request is initiated by the guest to
> 
> Instead of "guest" we should call it "device", since virtio is also
> meant for real hardware devices.

Did you mean to say "driver" instead of "device" here ? The
Virtio-device is the virtual hardware entity which is presented to the
guest OS by the host OS. And the software talking to this device at
the guest is called as the "driver".

I have replaced "host" with "device" and "guest" with "driver" at as
many places as possible. Thanks.

-- 
viresh

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

