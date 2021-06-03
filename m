Return-Path: virtio-comment-return-1876-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A099B98656E
	for <virtio-comment@lists.oasis-open.org>; Thu,  3 Jun 2021 12:46:10 +0000 (UTC)
Date: Thu, 3 Jun 2021 18:16:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20210603124605.zfsxatqwrefuhq2v@vireshk-i7>
References: <5672086c33948b7f765abb92de3f6846c8e1351f.1622724078.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
In-Reply-To: <5672086c33948b7f765abb92de3f6846c8e1351f.1622724078.git.viresh.kumar@linaro.org>
Subject: [virtio-comment] Re: [PATCH] virtio-gpio: add the device specification
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: virtio-comment@lists.oasis-open.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 03-06-21, 18:13, Viresh Kumar wrote:
> virtio-gpio is a virtual GPIO controller. It provides a way to flexibly
> communicate with the host GPIO controllers from the guest.
> 
> This patch adds the specification for it.
> 
> Based on the initial work done by:
> "Enrico Weigelt, metux IT consult" <lkml@metux.net>.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  conformance.tex |  26 ++++-
>  content.tex     |   1 +
>  virtio-gpio.tex | 256 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 279 insertions(+), 4 deletions(-)
>  create mode 100644 virtio-gpio.tex

And here is the new issue for the same.

https://github.com/oasis-tcs/virtio-spec/issues/110

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

