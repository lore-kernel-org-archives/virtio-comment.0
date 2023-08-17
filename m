Return-Path: <virtio-comment-return-7183-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A480C2FC0F
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 03:05:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D4B401922EC
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 03:05:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE10098642C
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 03:05:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 92DED985E68; Thu, 17 Aug 2023 03:05:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F1A899863F0;
	Thu, 17 Aug 2023 03:04:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375463553"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="375463553"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="763866783"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="763866783"
Message-ID: <a9de6da7-ea4e-060e-7535-0595de329689@intel.com>
Date: Thu, 17 Aug 2023 11:04:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 cohuck@redhat.com, parav@nvidia.com
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
References: <20230814192904.30062-1-lingshan.zhu@intel.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20230814192904.30062-1-lingshan.zhu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [RFC PATCH 0/5] virtio: introduce SUSPEND bit and vq state


Hi @Parav

I remember you are interested in live migration, any comments?

Thanks
Zhu Lingshan

On 8/15/2023 3:28 AM, Zhu Lingshan wrote:
> This seires introduces
> 1)a new SUSPEND bit in the device status
> Which is used to suspend the device, so that the device states
> and virtqueue states are stablized.
>
> 2)virtqueue state and accessors, to get and set last_avail_idx
> and last_used_idx of virtqueues.
>
> The main usecase of these new facilities is Live Migration.
>
> Furture work: dirty page tracking and in-flight descriptors.
>
> This is RFC, this series carries on Jason and Eugenio's pervious work.
>
> Any comments are welcome.
>
> Zhu Lingshan (5):
>    virtio: introduce SUSPEND bit in device status
>    virtio: introduce vq state as basic facility
>    virtio: The actions by the device upon SUSPEND
>    virtqueue: constraints for virtqueue state
>    virtio-pci: implement VIRTIO_F_QUEUE_STATE
>
>   content.tex       | 120 ++++++++++++++++++++++++++++++++++++++++++++++
>   transport-pci.tex |  15 ++++++
>   2 files changed, 135 insertions(+)
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

