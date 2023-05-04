Return-Path: <virtio-comment-return-5769-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AC9C77B7C
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 09:48:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 26BE826A2A
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 09:48:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0FEA0986640
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 09:48:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F2BE8983EB5; Thu,  4 May 2023 09:48:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD60398663F
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 09:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683193726; x=1685785726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1c4JWRIjgosSOoOgCLHdEs5gdmCZ6hGF7A4i2t15WQ=;
        b=adjgcglI8Sw5XfAL7PG2welzmXujwbl9Fo32udSU2hNTJZKrWaD8SO9mKlganHVDIK
         XBruEtQElqsYcAoEitCA7OB4p0w0ytQLyQwM3ckuE5efDo1OkZtxav9wilrvmkOLC9M5
         udleR9KQ3F4O9/8aH7QuxVh5bY/H1hMSYI7doFMVHPKI5JrWiiLC7eZFzwVsDXOY6Vdz
         daZyxp/yeWlCDhvq6kp/wbJblUW8r3YJP1QCdbvGFi9lkrBeOvoLfiVMXNXNdBhTrSq2
         9FJT/Kr+eXwoHYUAQt/ugVuoXVhU4vCA0c19scge6s0eNpYM9ZWe4vijdcndzkGzIjCQ
         2FNQ==
X-Gm-Message-State: AC+VfDyVksheasQFhq5JHTFHI60hY05EQ0DQrbyaWpyclvAmKnDaNoSm
	YI9UtJyF1IW2myZtGGrOOZqOGw==
X-Google-Smtp-Source: ACHHUZ6TxUwshxfe8T07bY1wJ+FZ1doOHsr55Eud99dGKdlNAyajS3hZBhrXGkRIVsVd9pW9F702SQ==
X-Received: by 2002:a17:902:d4d1:b0:1ab:2a77:6f4b with SMTP id o17-20020a170902d4d100b001ab2a776f4bmr3005106plg.26.1683193726174;
        Thu, 04 May 2023 02:48:46 -0700 (PDT)
Message-ID: <1a0b973a-11b0-6b24-f118-902a5809f7d1@bytedance.com>
Date: Thu, 4 May 2023 17:46:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, parav@nvidia.com, mst@redhat.com,
 stefanha@redhat.com, jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-2-pizhenwei@bytedance.com>
 <13c0e109-8d21-5294-6bd5-8f6fd6f707d2@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <13c0e109-8d21-5294-6bd5-8f6fd6f707d2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Re: [virtio-comment] [PATCH v2 01/11] transport-fabrics:
 introduce Virtio Over Fabrics overview



On 5/4/23 16:57, David Hildenbrand wrote:
> On 04.05.23 10:19, zhenwei pi wrote:
>> In the past years, virtio supports lots of device specifications by
>> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
>>
>> Introduce Virtio Over Fabrics transport to support "network defined
>> peripheral devices". With this transport, Many Virtio based devices
>> transparently work over fabrics. Note that the balloon device may not
>> make sense. Shared memory regions won't work.
> 
> Anything that involves memory (memory balloon, memory device, shared 
> memory) is fully incompatible I would guess.
> 

Hi,

Agree that memory device and shared memory is incompatible.

But memory balloon device, I don't know if it's possible to use in 
future. As far as I can imagine: a user process runs virtio-of target by 
listening localhost, and memory balloon isolates same pages from kernel, 
the user process maps these physical pages into virtual memory ...

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

