Return-Path: <virtio-comment-return-6038-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FED2C7EE23
	for <virtio-comment@archiver.kernel.org>; Mon, 29 May 2023 00:58:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2FC922B055
	for <virtio-comment@archiver.kernel.org>; Mon, 29 May 2023 00:58:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F22EF98658C
	for <virtio-comment@archiver.kernel.org>; Mon, 29 May 2023 00:58:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DBBD3986384; Mon, 29 May 2023 00:58:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C525C986471
	for <virtio-comment@lists.oasis-open.org>; Mon, 29 May 2023 00:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685321936; x=1687913936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3mbkOX3TfiuS0tviyMz9wygUvllQmGjI4/ybZQHSkjQ=;
        b=MKF7rWKwnnm49ZHnsN7P86F7iZJF0xH1f9HZe6Dl+XJbDuDG39Eo3gTv3xsx6b1XR6
         SFOiGO0kT/v+qA54Cz5WRx4BOOqTT21qByXFjxJ+9y3OjTYVFsAFVimLBgO5w4LraU7Y
         3G0Kt1UYBVlM9suEPx4vPChao401fTeGroo08uQMbmw7gNYVvWTMuWZqPCORMesXaU6t
         jBdt7brct85dj//ocjKDLzOcODeZ0qvD/rr0cf0H917aE2mSkjKvmg+gCq+brCuJ2RoC
         Krd1kKT7mTJzT7vkueDCwKiqyfXfZ5i2ekqTcltLoQv6BesXbFrIvMpdEpkVwuPAJbkz
         po6Q==
X-Gm-Message-State: AC+VfDzzEL0xrJvCVQmomgu5gQJTArC1s4Lw3jskQvU2fCDnl3cdTaHX
	3yjTVLmGZruNZdmZxdOEPBS3rQ==
X-Google-Smtp-Source: ACHHUZ6j7mcTyvw4hsIlhnVjuInxjxKc2pHUv5d5L/ObThW0byS8ArEQ0plfdPdr4mFxMdp/bGZ7eg==
X-Received: by 2002:a05:6a21:100e:b0:10b:d045:f0cf with SMTP id nk14-20020a056a21100e00b0010bd045f0cfmr7432337pzb.23.1685321936147;
        Sun, 28 May 2023 17:58:56 -0700 (PDT)
Message-ID: <7c2c3b40-3099-1525-352e-9ab1ef4682ac@bytedance.com>
Date: Mon, 29 May 2023 08:56:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: parav@nvidia.com, mst@redhat.com, stefanha@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] PING: [PATCH v2 00/11] Introduce Virtio Over Fabrics

PING!

On 5/4/23 16:18, zhenwei pi wrote:
> v1 -> v2:
> - Suggested by Parav, split a large patch into several small patches.
> - Small changes for VQN, add "There is no strict style limitation".
> - Move *bytes* field limitation from get/set config opcode section to
>    Config Command.
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
> zhenwei pi (11):
>    transport-fabrics: introduce Virtio Over Fabrics overview
>    transport-fabrics: introduce Virtio Qualified Name
>    transport-fabircs: introduce Segment Descriptor Definition
>    transport-fabrics: introduce Stream Transmission
>    transport-fabrics: introduce Keyed Transmission
>    transport-fabrics: introduce command set
>    transport-fabrics: introduce opcodes
>    transport-fabrics: introduce status of completion
>    transport-fabrics: add TCP&RDMA binding
>    transport-fabrics: add device initialization
>    transport-fabrics: support inline data for keyed transmission
> 
>   content.tex           |    1 +
>   transport-fabrics.tex | 1021 +++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 1022 insertions(+)
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

