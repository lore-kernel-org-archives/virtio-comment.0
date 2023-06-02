Return-Path: <virtio-comment-return-6085-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2575C7EE2A
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 01:52:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F1D7E2AF7B
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 01:52:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E57FC9867DF
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 01:52:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D674D9867DA; Fri,  2 Jun 2023 01:52:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C2F109867DB
	for <virtio-comment@lists.oasis-open.org>; Fri,  2 Jun 2023 01:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685670754; x=1688262754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7nws0E7k687ZCTpZwkp8DsVeikc49cp/phKSHmwd5g=;
        b=QGTrOU4jl+Lgyq3YfYVEeG5Lu3mmOMPCo6evD9eeh9fm/7Nvvj3I527jfBkVOv2S1U
         9xFPM+rmkV4KG2EJg+VCmbilqPHd60O7Lpfur3GBo8vgtJzXK2iu1oXenidTflaPpr/w
         73dunRdJ9PdV+oER+ptumqbik1FZ5HxrwIyeYlHeHUg/RYjf6la0eAXUqCJ6T5GscrLy
         NuYdKpgh4oMGpjT92ZGa/4zM+3ns49X9BcYEKCqHx4roD3FpCD81EfqRH8Yo+NT9pLRD
         aGaRYPJ6hUMTGldqFmRHZWLu0k7R5t9FPcXwGryou9nHSjTrlvUXz/cj1KDjASfwnG4Q
         XVtg==
X-Gm-Message-State: AC+VfDyz75V+S1SacKlGxk2nOQAIURNxGQ7auQFxx5Tl+V+D6GoCnpFn
	7AIpEHuidFNmL3/EycE9DbOWJw==
X-Google-Smtp-Source: ACHHUZ7yx74shaRJTbek09tAcAHCvJAp5Zk08ZD0pR/A4J88qRXtdnobZNQiWaMnm17PgeBmeagBeg==
X-Received: by 2002:a92:c6c5:0:b0:33d:48a:be90 with SMTP id v5-20020a92c6c5000000b0033d048abe90mr3978960ilm.7.1685670754217;
        Thu, 01 Jun 2023 18:52:34 -0700 (PDT)
Message-ID: <1572fc8c-2c92-10df-e109-6586a9692e0a@bytedance.com>
Date: Fri, 2 Jun 2023 09:50:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-3-pizhenwei@bytedance.com>
 <20230531140640.GD1248296@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230531140640.GD1248296@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Re: [virtio-comment] [PATCH v2 02/11] transport-fabrics:
 introduce Virtio Qualified Name



On 5/31/23 22:06, Stefan Hajnoczi wrote:
> On Thu, May 04, 2023 at 04:19:01PM +0800, zhenwei pi wrote:
>> Add VQN section. The VQN is a little different from iSCSI/NVMe-oF on
>> style limitation. Because iSCSI/NVMe-of is storage specific protocol,
>> the full string IQN(for iSCSI/iSER) and NQN(for NVMe-oF) represents
>> a "storage access address". However, Virtio Over Fabrics works as
>> transport layer rather than device layer, a URL style string is better
>> to Virtio Over Fabrics. For example:
>> virtio-of://blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
>> virtio-of://blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
>> ...
>> virtio-of://crypto-resource/25307f22-e5a8-4ea2-b7ca-79f5c3bebc3c
> 
> I'm not sure what blk-resource and nvme-pool are in these URLs?
> 
> Should the patch mention the virtio-of:// URI scheme?
> 

Sorry, I missed the address and port. They should be:
virtio-rdma://192.168.1.100:8549/blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
virtio-tcp://192.168.1.110/blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
...

This is human readable string. when the software(or hardware) handles 
this, this should be translated into:
transport: RDMA
address: 192.168.1.100
port: 8549 (default port 8549(CRC-16/ARC of "Virtio"))
target VQN: blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1

This section only defines the "VQN" schema, not the resource string schema.

For a process, I think the following two are both fine:
./foo --full-url 
virtio-rdma://192.168.1.100:8549/blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
./foo --transport rdma --address 192.168.1.100 --port 8549 --tvqn
blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1

[snip]

> 
> Is the maximum name 255 UTF-8 bytes plus a NUL character? Please state
> this in the spec. For example:
> 
>    \item The string is NUL terminated.
>    \item The maximum name is 256 bytes in length, including the NUL character.
> 
OK, fix this in the next version.

>> +\item There is no strict style limitation.
> 
> I think it's necessary to define representations for specific fabrics
> (e.g. TCP/IP) so that VQNs can be exchanged between different VIRTIO
> implementations (VMMs, DPUs, command-line utilities, etc). Otherwise two
> different implementations may represent the same address differently.
> 
> Stefan

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

