Return-Path: virtio-comment-return-1890-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C6DC1986586
	for <virtio-comment@lists.oasis-open.org>; Tue,  8 Jun 2021 11:30:12 +0000 (UTC)
Date: Tue, 8 Jun 2021 17:00:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20210608113008.4pm4n3k6e5cuk76n@vireshk-i7>
References: <e687cd6bdafe1ad13205d99989163299649e20c9.1622794175.git.viresh.kumar@linaro.org>
 <db7ad3b4-36b5-1988-8f9a-b50a7e820150@metux.net>
 <CAKohpomU=0nO+yyywniZmLegvWSz9WdSf4jVwR=Z2J_XXoh8iA@mail.gmail.com>
 <66c30d89-c7ed-fc1a-fd0c-6ff188f675cb@redhat.com>
 <20210607054257.corogdevyxi3clt6@vireshk-i7>
 <3bca063e-0a3c-2b21-2400-5e0138b3d3c3@metux.net>
MIME-Version: 1.0
In-Reply-To: <3bca063e-0a3c-2b21-2400-5e0138b3d3c3@metux.net>
Subject: Re: [virtio-comment] [PATCH V2] virtio-gpio: add the device
 specification
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On 08-06-21, 13:02, Enrico Weigelt, metux IT consult wrote:
> If newly added features are orthogonal, that would do the job.

Yes they are.

> Yes. Newer versions of the protocol could add more operations like
> setting a bunch of gpios at once (only some HW really supports that, so
> we yet have to sort out whether that should be blindly emulation by host
> or refused - depending on how well this fits in to timing requirements).
> Other new things could be configuring pullup/down (which has some
> overlap with pinmux - some hw does it in the gpio controller, some by
> separate pinmux), debounce filters, level thresholds, etc, etc ...
> 
> For now we're doing just the very basics - switch on/off, perhaps get an
> irq if input changes. The more complex, not so common stuff is left for
> future revisions. And to do that, we need to tell the driver what is
> supported by the device.
> 
> If there's a more granular way instead of just a version number, am
> very fine with that. (A little example would be very appreciated).

I have added a feature (for IRQ) in the new spec, will send it
shortly.

> OTOH, I don't think that an practically not used version field does
> hurt so bad.

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

