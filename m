Return-Path: <virtio-comment-return-8157-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFC5C4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:21:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AB23A2A89B
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:21:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 89467986C44
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:21:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 71D81986C3B; Fri,  3 Nov 2023 14:21:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62C2D986C3C
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 14:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="392833954"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="392833954"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="827495681"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="827495681"
Message-ID: <378a54b3-1dd6-4626-95af-5485727923e2@intel.com>
Date: Fri, 3 Nov 2023 22:21:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
 stefanha@redhat.com, virtio-comment@lists.oasis-open.org, parav@nvidia.com
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064352-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231103064352-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking



On 11/3/2023 6:46 PM, Michael S. Tsirkin wrote:
> On Fri, Nov 03, 2023 at 06:34:37PM +0800, Zhu Lingshan wrote:
>> +\begin{lstlisting}
>> +struct virtio_pci_dity_page_track {
>> +        u8 enable;               /* Read-Write */
>> +        u8 gra_power;            /* Read-Write */
>> +        u8 reserved[2];
>> +        le32 {
>> +            pasid: 20;           /* Read-Write */
>> +            reserved: 12;
>> +        };
>> +        le64 bitmap_addr;        /* Read-Write */
>> +        le64 bitmap_length;      /* Read-Write */
>> +};
>> +\end{lstlisting}
> Okay, so it's a simple mailbox in config space.  Which by itself is
> probably a very reasonable idea - more or less what I suggested.
> However, using such a generic facility just for the dirty bitmap seems
> too limited.  Please make it accept arbitrary commands. Reusing admin
> command structure with a special "device itself" group sounds like one
> way to do it.
processing admin cmds in a cap may be too complex and overkill.
we need to handle variable length of cmds, handle async returned 
results, and so on.

This struct seems easy and simple. And shall we use platform facilities 
like vt-d
to track dirty pages?
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

