Return-Path: <virtio-comment-return-6864-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9078EEB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Jul 2023 07:09:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C171774109
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Jul 2023 07:09:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5B9A986730
	for <virtio-comment@archiver.kernel.org>; Wed, 19 Jul 2023 07:09:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8C45698669A; Wed, 19 Jul 2023 07:09:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74C2498669B
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Jul 2023 07:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689750587; x=1692342587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0S4SBxwXMh2m3HWp7V1h4RYcqVT4v2b5fKNUrxMdWU=;
        b=QSn95+zNEddW3vaa0WioERfvcMxWz39cyGeZ8469010p027V70RhYvwTYhPFJ4HLh7
         iNfL8be6TBQY2hG/+YCOpQVRFTy00XoiTMn4uAMSfOxpzsh+iIuX9P9d17egZRTGwGaT
         4644jpoRovFPO+Htn4cwqAVKnVpLUKAdRjcQHKsDP8MQ8G4JMTiuND7tLLCy55rb0LxP
         mqE4ZzhzzwEn9BVZKp2om1dewAQYJ6qZLpQRYCtfOZshXK5d82x4UehmqZUyJiuwavbT
         JDUyoeXxWhpI+VfTUKxmP0hviodDvsUsBN9sU1c5GrVF8Sh8yL4h5TUJReHqV+Zsx+ry
         eing==
X-Gm-Message-State: ABy/qLYv/Se6TtGes9w6vu/yGLTuT50G9234XNzm/MCQhmNFC1YSkiLi
	kZScb7Aoy/d1OwwAbkdFNrqRGw==
X-Google-Smtp-Source: APBJJlFq7IXDal+seFtoVBEr29c35gomHdGxFe0h4VKOEz+7a8ZAa7Hj3IaBAK17CJr7Knlw9JvVXQ==
X-Received: by 2002:a05:6a00:198c:b0:63a:ea82:b7b7 with SMTP id d12-20020a056a00198c00b0063aea82b7b7mr19957492pfl.28.1689750586722;
        Wed, 19 Jul 2023 00:09:46 -0700 (PDT)
Message-ID: <aae0b5ac-96ad-00ab-ace1-9fa2c0a15498@bytedance.com>
Date: Wed, 19 Jul 2023 15:07:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: stefanha@redhat.com, parav@nvidia.com, mst@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, zhouhuaping.san@bytedance.com,
 xinhao.kong@duke.edu
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230626072551.1709389-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] PING: [PATCH v4 0/7] Introduce Virtio Over Fabrics

Hi Stefan & Parav

Ping!

On 6/26/23 15:25, zhenwei pi wrote:
> Hi Stefan & Parav
> 
> There is minor flaws in v3 series, please skip v3, review the v4
> instead. Thanks!
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
>   transport-fabrics.tex | 871 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 872 insertions(+)
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

