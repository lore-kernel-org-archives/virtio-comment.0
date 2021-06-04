Return-Path: virtio-comment-return-1878-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 87DCB986575
	for <virtio-comment@lists.oasis-open.org>; Fri,  4 Jun 2021 03:33:51 +0000 (UTC)
Date: Fri, 4 Jun 2021 09:03:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20210604033344.c2tnt7upv7y3soaq@vireshk-i7>
References: <fe497091797c31f8b59a989fbd34b93fd07adce4.1622615811.git.viresh.kumar@linaro.org>
 <0f36102a-8ce0-8cda-cb3f-3b41b346fad9@metux.net>
 <e0bb902f-d009-8aa1-0c71-25989d3d1269@intel.com>
MIME-Version: 1.0
In-Reply-To: <e0bb902f-d009-8aa1-0c71-25989d3d1269@intel.com>
Subject: Re: [virtio-comment] Re: [PATCH] Reserve device id for GPIO device
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Jie Deng <jie.deng@intel.com>
Cc: "Enrico Weigelt, metux IT consult" <lkml@metux.net>, virtio-comment@lists.oasis-open.org, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>
List-ID: <virtio-comment.lists.oasis-open.org>

On 04-06-21, 10:28, Jie Deng wrote:
> Has anyone ever tried to use GPIO in the guest to generate waveform ?

I haven't tried the code yet, I just started where Enrico left
earlier. Done with Id allocation and specs (yes reviews pending), will
be looking into kernel now.

> When the frequency reaches a certain level, the waveform will become
> inaccurate
> due to the delay and uncertainty of the communication time between virtio
> frontend
> and backend. I'm not sure if any good solution for this case.

This is expected I would say. The interface is going to be slow and at
some frequency it will break the waveform.

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

