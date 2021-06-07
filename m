Return-Path: virtio-comment-return-1885-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1E1DD9862E4
	for <virtio-comment@lists.oasis-open.org>; Mon,  7 Jun 2021 05:43:02 +0000 (UTC)
Date: Mon, 7 Jun 2021 11:12:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20210607054257.corogdevyxi3clt6@vireshk-i7>
References: <e687cd6bdafe1ad13205d99989163299649e20c9.1622794175.git.viresh.kumar@linaro.org>
 <db7ad3b4-36b5-1988-8f9a-b50a7e820150@metux.net>
 <CAKohpomU=0nO+yyywniZmLegvWSz9WdSf4jVwR=Z2J_XXoh8iA@mail.gmail.com>
 <66c30d89-c7ed-fc1a-fd0c-6ff188f675cb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <66c30d89-c7ed-fc1a-fd0c-6ff188f675cb@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2] virtio-gpio: add the device
 specification
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: "Enrico Weigelt, metux IT consult" <lkml@metux.net>, virtio-comment@lists.oasis-open.org, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On 07-06-21, 13:25, Jason Wang wrote:
> The spec define some general features and it also allow device to implement
> its own features.
> 
> I guess in this case, it might be just a feature like VIRTIO_GPIO_F_BULK?

Oh yes, it makes sense. So we don't really need a _version_ here, but
can just keep on adding more and more features.

> I'm not familiar with GPIO, but a question is, consider we have virtqueue,
> so actually bulking is already supported?

Virtqueue is there yes, but we don't have operations here yet (in this
version of the spec) which support setting 10 GPIO pins in output mode
with a single request from driver to device.

I think Enrico was looking to have a way to add provision for such
operations later on if required.

And the features will make that work. Thanks Jason.

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

