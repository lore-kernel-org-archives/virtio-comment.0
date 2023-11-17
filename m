Return-Path: <virtio-comment-return-8415-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7903C072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 03:47:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C5ABC750AB
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 03:47:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A2A0A986E11
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 03:47:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8BA6D986D61; Fri, 17 Nov 2023 03:47:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 72CDE986E0F
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 03:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700192871; x=1700797671;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EHvYLZ4jGppDayKAhd1U3wgDzU5CpVjKOJjcNT6B1Z8=;
        b=njkgxze20hPpirE+7P3eJZvOlKW7C4ExYQZNrP1c4Mcewm9Blrm1A70bZzMfihzI1C
         IPv/n8hwiE9/hIcAJ6d84Lcu/DosdcUGCSMJjwvFRk8/EjKpbwOBwqfuO89wr+I6bKx8
         r0vzVDhQbGIKU0uf2UTuZFZmlCPdbep12WTXBrVUQ0OD4aVb7RAG5caRaFEadGKHVhuH
         NhAQgyJ+4JHNOoKwhZxKOH/mBI/PXfXfo64bgtqoZuA/E0TN+Y+8MpRlteUz98+ItE0j
         K8RQBwLyCqhu2Ku1u0GXnOusf9aTwPkLC4Bk19OVVEjhk6g7tjoa+HRKdtKOjCK81Bx/
         6JdQ==
X-Gm-Message-State: AOJu0YzCqX1BCcWt0XTmcpmjO2A64w0BvCN3Nh2QiDbkwgRb5KDrrC6O
	ILMdg8Sfs5lfMqT8dxSlyVPDyg==
X-Google-Smtp-Source: AGHT+IHGrPTFK57FGK9ST9y24MBqOxHpD/a5YmFMPmHUUhBDopo8OkuM3U6bBjkp8F+SfqRFIzqe/g==
X-Received: by 2002:a05:6a20:914d:b0:15c:b7ba:6a4d with SMTP id x13-20020a056a20914d00b0015cb7ba6a4dmr22154471pzc.50.1700192871348;
        Thu, 16 Nov 2023 19:47:51 -0800 (PST)
Message-ID: <2e46e50d-62b2-41f7-82e0-66b3ecf71bae@bytedance.com>
Date: Fri, 17 Nov 2023 11:43:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: stefanha@redhat.com, raphael.norwitz@nutanix.com
Cc: jasowang@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com,
 parav@nvidia.com, houp@yusur.tech, zhouhuaping.san@bytedance.com,
 xinhao.kong@duke.edu
References: <20231023104647.290759-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20231023104647.290759-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH v5 0/7] Introduce Virtio Over Fabrics

Hi Stefan & Raphael,

Let's continue the discussion in this series, there is a link of 
multi-path/reconnect discussion with Raphael, please see the link:
https://lists.oasis-open.org/archives/virtio-comment/202307/msg00259.html


I think current version supports reconnect in several steps:
1, the transport layer reconnects successfully
2, virtio device initializes feature negotiation, sets status, setup VQ
3, retry VQ requests

The question is "which address to re-connect" in step 1?
a, Raphael pointed out redirection-based iSCSI implementations, this 
needs a "redirection" response in connect completion(from an agent), 
then connect to the specific address of target. (this needs 
specification change)
b, reconnect to the original address. (this may fail)
c, the initiator resolves domain name by DNS.
d, configure address list for a single initiator, the initiator retry 
one by one during reconnect until success.


There is limitation for multi-path, because one TCP or RDMA connection 
per VQ in current version. what about adding a new concept --- path?
A virtio-of device instance has one or more virtio-of path, a virtio-of 
path contains a control queue and several VQ.

On 10/23/23 18:46, zhenwei pi wrote:
> v4 -> v5:
> - 2 typo fixes.
> - use 'length' & 'in_length' in VQ completion.
> 
> More discussion with Raphael Norwitz <raphael.norwitz@nutanix.com>:
> https://lists.oasis-open.org/archives/virtio-comment/202307/msg00259.html
> 
> v3 -> v4:
> [PATCH v3 4/7] transport-fabrics: introduce command set
> - typo fixes: u16 -> le16, u64 -> le64
> - fix unaligned struct virtio_of_completion_get_keyed_num_descs
> - drop duplicated keepalive completion structure
> 
> v2 -> v3:
> [PATCH v2 01/11] transport-fabrics: introduce Virtio Over Fabrics
> - Drop referring to PCI.
> - Drop undefined concept 'vring'.
> - Add 'Virtio-oF'(short for 'Virtio Over Fabrics'), and use this instead.
> - Add mapping between target and initiator.
> - Add Virtio-oF queue mapping.
> - Fix grammar flaws.
> 
> [PATCH v2 02/11] transport-fabrics: introduce Virtio Qualified Name
> - Use 'NUL' instead of 'NULL'.
> - Add 'including the NUL character' in maximum name.
> 
> [PATCH v2 03/11] transport-fabircs: introduce Segment Descriptor
> [PATCH v2 04/11] transport-fabrics: introduce Stream Transmission
> [PATCH v2 05/11] transport-fabrics: introduce Keyed Transmission
> - Merge three patches into one.
> - Rename this section to 'Virtio-oF Protocol Data Unit' instead of 'Transmission Protocol'.
> - Remove undefined 'opcode' reference.
> - Drop common 'struct virtio_of_vring_desc'
> - For stream data transfers, use a single command/completion instead of descriptors.
> - For keyed data transport, use a single descriptor instead of multi descriptors. Also support keyed descriptor count probe.
> 
> [PATCH v2 06/11] transport-fabrics: introduce command set
> [PATCH v2 07/11] transport-fabrics: introduce opcodes
> [PATCH v2 08/11] transport-fabrics: introduce status of completion
> - Merge three patches into one.
> - Drop common data structures definition, define data structure for each command.
> - Drop virtio_of_op_get_num_queues, the Virtio-oF device instance would response error status on invalid virtqueue.
> - Allow Virtio-oF virtqueue to use empty connect body.
> - Allow Virtio-oF virtqueue to specify queue size on connecting.
> - Drop errno like status, define detailed status.
> - Other minor fixes.
> 
> [PATCH v2 09/11] transport-fabrics: add TCP&RDMA binding
> - Rename TCP to TCP/IP to avoid ambiguity.
> - Add TLS TCP/IP transport.
> - Add RDMA opcode usage.
> 
> [PATCH v2 10/11] transport-fabrics: add device initialization
> - Drop PCI reference, describe device initialization instead.
> - Fix grammar flaws.
> 
> [PATCH v2 11/11] transport-fabrics: support inline data for keyed
> - Use eager buffer instead.
> 
> 
> v1 -> v2:
> - Suggested by Parav, split a large patch into several small patches.
> - Small changes for VQN, add "There is no strict style limitation".
> - Move *bytes* field limitation from get/set config opcode section to
>    Config Command.
> 
> 
> v1:
> Introduce Virtio-oF specification, include:
> - overview
> - Virtio Qualified Name
> - Segment Descriptor definition
> - Buffer Mapping definition: Stream Transmission and Keyed Transmission
> - Command set definition
> - opcode definition
> - status definition
> - transport binding: TCP and RDMA
> - device initialization
> 
> Previous discussion:
> https://lists.oasis-open.org/archives/virtio-comment/202304/msg00442.html
> 
> zhenwei pi (7):
>    transport-fabrics: introduce Virtio Over Fabrics overview
>    transport-fabrics: introduce Virtio-oF Qualified Name
>    transport-fabrics: introduce Virtio-oF Protocol Data Unit
>    transport-fabrics: introduce command set
>    transport-fabrics: introduce transport binding
>    transport-fabrics: add device initialization
>    transport-fabrics: introduce keyed eager buffers
> 
>   content.tex           |   1 +
>   transport-fabrics.tex | 875 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 876 insertions(+)
>   create mode 100644 transport-fabrics.tex
> 

-- 
zhenwei pi

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

