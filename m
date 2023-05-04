Return-Path: <virtio-comment-return-5768-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430ADC77B7C
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:57:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6298D2AC4A
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:57:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 477079866B1
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:57:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 36727983EB5; Thu,  4 May 2023 08:57:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2377F98663F
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: hgFHk6W-P12dwJCWDipxPA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683190667; x=1685782667;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yH6Sf5aOlVHESSmCvc4phlCLNaYsLrC9E4Q65mO1Lf0=;
        b=Kv3drwKwhtIjtu/NWIGJdMYKk8QY9/Ui0ef9tS+KTm1CeiDsJF+Y012mS7al1n8LRK
         PYVrfHFI5f0ZzNfp+w9LTvN5MrS7xekU3OMe4PKhLDmDjj8kBhXzX4YSpKGrjI4ci6vk
         lJv3CtUgqX1UMv/HUrUn2N+rHGfkRm6wK9pZ0N7c4fOtnHhi5kaifer+E/sP2lSvYN+q
         6ch394iYgJEmnHq8FA68ML3kgPVbsTmeaa+SRhB3Sq+DIFDaimskYBzrT8Oc8q5iuUIe
         eRf9SUz9g0910WaeV486D0UUaoqoQaaA8dKq1Fua+TinAfUCnAo9+sZfJuM32+/otUqw
         tePQ==
X-Gm-Message-State: AC+VfDzQL+rVc1V3hrEM9VS2EphaQrL/gxblyIv+OGNky3+uRRgO76uI
	hxUGJeczzsfLOzXsIQylSB4XOSAtsobFdOw0UceYFa4gRu1im5OPzXv7EuQYgnObgoJ6q3kYw7I
	kwr9RTLMFHMCrRjhnjhwnxkfIRktEsnCNtg==
X-Received: by 2002:a5d:5222:0:b0:306:434:f8ef with SMTP id i2-20020a5d5222000000b003060434f8efmr2122612wra.70.1683190666909;
        Thu, 04 May 2023 01:57:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ69mCopLryPBWNe++CyaQKIm/xsOFDay1vhnlzv2Vqh0Yb+2ipZTz/Rw1X0fA8joLN5pphZzw==
X-Received: by 2002:a5d:5222:0:b0:306:434:f8ef with SMTP id i2-20020a5d5222000000b003060434f8efmr2122596wra.70.1683190666378;
        Thu, 04 May 2023 01:57:46 -0700 (PDT)
Message-ID: <13c0e109-8d21-5294-6bd5-8f6fd6f707d2@redhat.com>
Date: Thu, 4 May 2023 10:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: zhenwei pi <pizhenwei@bytedance.com>, parav@nvidia.com, mst@redhat.com,
 stefanha@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-2-pizhenwei@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230504081910.238585-2-pizhenwei@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] [PATCH v2 01/11] transport-fabrics: introduce
 Virtio Over Fabrics overview

On 04.05.23 10:19, zhenwei pi wrote:
> In the past years, virtio supports lots of device specifications by
> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
> 
> Introduce Virtio Over Fabrics transport to support "network defined
> peripheral devices". With this transport, Many Virtio based devices
> transparently work over fabrics. Note that the balloon device may not
> make sense. Shared memory regions won't work.

Anything that involves memory (memory balloon, memory device, shared 
memory) is fully incompatible I would guess.

-- 
Thanks,

David / dhildenb


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

