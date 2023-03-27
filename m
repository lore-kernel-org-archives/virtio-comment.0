Return-Path: <virtio-comment-return-5037-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AC1C7619A
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Mar 2023 11:35:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3E83C2AD47
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Mar 2023 11:35:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B9D99862A8
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Mar 2023 11:35:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1B2AA983DE9; Mon, 27 Mar 2023 11:35:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 084EF986260
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Mar 2023 11:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ra6kPq1oOwe_7xGH-qlnJw-1
From: Cornelia Huck <cohuck@redhat.com>
To: Haixu Cui <quic_haixcui@quicinc.com>, virtio-dev@lists.oasis-open.org,
 virtio-comment@lists.oasis-open.org
Cc: Haixu Cui <quic_haixcui@quicinc.com>, quic_ztu@quicinc.com
In-Reply-To: <20230324080806.21229-1-quic_haixcui@quicinc.com>
Organization: Red Hat GmbH
References: <20230324080806.21229-1-quic_haixcui@quicinc.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 27 Mar 2023 13:35:45 +0200
Message-ID: <87355qs9ym.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH] virtio-spi: add the device specification

On Fri, Mar 24 2023, Haixu Cui <quic_haixcui@quicinc.com> wrote:

> virtio-spi is a virtual SPI master and it allows a guset to operate and
> use the physical SPI master controlled by the host.

Please spell out what SPI is the first time you use it.

Also, please remember to post the separate patch that reserves the ID
for it.

>
> Signed-off-by: Haixu Cui <quic_haixcui@quicinc.com>
> ---
>  conformance.tex                         |  12 +-
>  content.tex                             |   1 +
>  device-types/spi/description.tex        | 153 ++++++++++++++++++++++++
>  device-types/spi/device-conformance.tex |   7 ++
>  device-types/spi/driver-conformance.tex |   7 ++
>  5 files changed, 176 insertions(+), 4 deletions(-)
>  create mode 100644 device-types/spi/description.tex
>  create mode 100644 device-types/spi/device-conformance.tex
>  create mode 100644 device-types/spi/driver-conformance.tex

(...)

> diff --git a/device-types/spi/description.tex b/device-types/spi/description.tex
> new file mode 100644
> index 0000000..0b69700
> --- /dev/null
> +++ b/device-types/spi/description.tex
> @@ -0,0 +1,153 @@
> +\section{SPI Master Device}\label{sec:Device Types / SPI Master Device}
> +
> +virtio-spi is a virtual SPI master and it allows a guest to operate and use
> +the physical SPI master devices controlled by the host.

Here as well; it's even more important that the acronym is expanded at
least once in the spec.

Also, does this mean that the device is supposed to be an interface to
physical SPI master devices? It would be good if this could be framed
without guest/host terminology (although this can be used as an
example.) Maybe something like

"The virtio SPI master device is a virtual SPI (Serial Peripheral
Interface) master device, potentially interfacing to another SPI master
device. It allows, for example, for a host to expose access to a
physical SPI master device controlled by the host to a guest."

?

> +
> +In a typical host and guest architecture with Virtio SPI, Virtio SPI driver 
> +is the front-end and exists in the guest kernel, Virtio SPI device acts as 
> +the back-end and exists in the host. And VirtQueues assist Virtio SPI driver 
> +and Virtio SPI device in perform VRing operations for communication between 
> +the front-end and the back-end.

I'm not sure I can parse this properly -- does this mean that a
virtqueue is used for communication between a front-end and a back-end?

(Didn't look at the remainder of the patch yet.)


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

