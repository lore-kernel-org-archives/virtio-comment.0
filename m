Return-Path: <virtio-comment-return-7392-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE2CCA5502
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 07:36:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DE4ED759CC
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 07:36:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C360E98663D
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 07:36:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ADB3C986630; Wed, 13 Sep 2023 07:36:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DC29986632
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 07:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vrzr8Qv_1694590611;
Message-ID: <1694590604.050564-1-xuanzhuo@linux.alibaba.com>
Date: Wed, 13 Sep 2023 15:36:44 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: <hengqi@linux.alibaba.com>,
 <xuanzhuo@linux.alibaba.com>,
 <shahafs@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 <virtio-comment@lists.oasis-open.org>,
 <mst@redhat.com>,
 <cohuck@redhat.com>
References: <20230909143218.524481-1-parav@nvidia.com>
 <20230909143218.524481-2-parav@nvidia.com>
In-Reply-To: <20230909143218.524481-2-parav@nvidia.com>
Subject: [virtio-comment] Re: [PATCH 1/2] conformance: Add missing virtqueue reset conformance references

On Sat, 9 Sep 2023 17:32:17 +0300, Parav Pandit <parav@nvidia.com> wrote:
> Add the missing references to the virtqueue reset related conformance
> requirements.
>
> Signed-off-by: Parav Pandit <parav@nvidia.com>

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


> ---
>  conformance.tex | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/conformance.tex b/conformance.tex
> index dc00e84..863f9c5 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -76,6 +76,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Reset}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Configuration Space}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues}
> +\item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message Framing}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
> @@ -162,6 +163,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
> --
> 2.34.1
>

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

