Return-Path: virtio-comment-return-1874-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A55598652B
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Jun 2021 12:11:11 +0000 (UTC)
Date: Wed, 2 Jun 2021 17:41:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20210602121107.nuucnz5225d6egxh@vireshk-i7>
References: <fe497091797c31f8b59a989fbd34b93fd07adce4.1622615811.git.viresh.kumar@linaro.org>
 <0f36102a-8ce0-8cda-cb3f-3b41b346fad9@metux.net>
MIME-Version: 1.0
In-Reply-To: <0f36102a-8ce0-8cda-cb3f-3b41b346fad9@metux.net>
Subject: [virtio-comment] Re: [PATCH] Reserve device id for GPIO device
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: virtio-comment@lists.oasis-open.org, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>
List-ID: <virtio-comment.lists.oasis-open.org>

On 02-06-21, 13:57, Enrico Weigelt, metux IT consult wrote:
> On 02.06.21 08:42, Viresh Kumar wrote:
> > Use device ID 41
> 
> Thanks for submitting that. I should have been my duty, but I've been
> too busy w/ other things.
> 
> You've probably already seen my spec in the Linux virtio-gpio patch
> queue. Feel free to texify it for submitting here. (*1)

I am halfway through :)

> Also please remind me to update the device id (need to fix kernel as
> well as qemu side).

Sure, I would be fine to re-spin the kernel driver as well (we need to
really finish this stuff sooner) :)

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

