Return-Path: <virtio-comment-return-6937-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C095EC001DF
	for <virtio-comment@archiver.kernel.org>; Tue,  1 Aug 2023 02:03:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 023943309C
	for <virtio-comment@archiver.kernel.org>; Tue,  1 Aug 2023 02:03:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6CC4986428
	for <virtio-comment@archiver.kernel.org>; Tue,  1 Aug 2023 02:03:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C4327983EFA; Tue,  1 Aug 2023 02:03:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE00E98639B
	for <virtio-comment@lists.oasis-open.org>; Tue,  1 Aug 2023 02:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690855410; x=1691460210;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/8rF1Dl/wJ8JBRLmyMnqkNINZ4akLg1AfR/ib1Ahx0=;
        b=ky2FSmfeTwQ2Cp6tpit4EuUJUyjM1qz9oJbJIrdKfgwdhgM0ZzcwRJlE8Vn4KENQx0
         aVWJRySVlb+KwIt78iHkJWnEvt8AerLOKs2aRDWnKWzwPsEjWzLaL5gWRVQhYuPSVmDo
         uRWar6VpEB1qjtefS6RhZVE5Eiy3LmQrgBfwVlSSFoTVR75ZC8lS7X+aZGaSeNX98eco
         kmxEYXO+5I2GaCTYE23w+LUQPXLOebIyKRki/A4kjnyQJCLyzNBAprvKgapX+bASkcoN
         kO1TA/uIV0/fwWYlAoqsfPKJdIUV6/qJcf5LeO4l3ZcvTzOF3adwm03tPSttjwz/fvJh
         BpFw==
X-Gm-Message-State: ABy/qLaH3GKTpejshbVBIsdtK1bR4Csou3nXBdnm6VemYVhREPtEMiPM
	YWdpvBxyu56kIxGSOjHOuzIKJw==
X-Google-Smtp-Source: APBJJlHhVE/PTZHOzLboSFQSHJuAxc3LF07W1MkGDVg1b1Y/KIyJN6Sc8U6mrnv3km/jKMChaBVIuA==
X-Received: by 2002:a17:902:6b49:b0:1bb:c0a6:2ee3 with SMTP id g9-20020a1709026b4900b001bbc0a62ee3mr9866752plt.26.1690855409822;
        Mon, 31 Jul 2023 19:03:29 -0700 (PDT)
Message-ID: <c35a7f5c-5fff-ff26-998a-cb9b54793b70@bytedance.com>
Date: Tue, 1 Aug 2023 10:00:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "parav@nvidia.com"
 <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "houp@yusur.tech" <houp@yusur.tech>,
 "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
 "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-5-pizhenwei@bytedance.com>
 <F0CEEC0A-4087-4BAF-B0AB-E56EF078457D@nutanix.com>
 <be483647-00db-7529-0632-60ace98efd72@bytedance.com>
 <1C01DF14-E01F-454B-B9DE-590D37ADD3A6@nutanix.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <1C01DF14-E01F-454B-B9DE-590D37ADD3A6@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Re: [virtio-comment] [PATCH v4 4/7] transport-fabrics: introduce
 command set



On 8/1/23 08:25, Raphael Norwitz wrote:
> 
> 
>> On Jul 30, 2023, at 10:34 PM, zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>>
>>
>> On 7/30/23 07:28, Raphael Norwitz wrote:
>>> As noted in my high level feedback I think the protocol should have redirection semantics.
>> [snip]
>>>> +\end{lstlisting}
>>>> +
>>>> +\paragraph{Connect Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Connect Command}
>>>> +
>>> This would be a good place to introduce some kind of target-side redirect mechanism to support redirecting to another IP.
>>> Probably just another op/status code and message from the target for redirection?
>>
>> Redirect mechanism is not used widely in my practice. Instead, multi path mechanism is used a lot. Would you please share your experience on this?
>>
> 
> Agreed - multipath is more common in iSCSI implementations. How would you make multipath work for Virtio-o-F since you only have one TCP or RDMA connection per VQ?
> 
> What concern do you have with redirection-based iSCSI implementations? It’s conceptually quite trivial. We have published documentation on our implementation here: https://www.nutanixbible.com/5b-book-of-ahv-how-it-works.html .
> 
> I imagine Virtio-oF implementations could do something similar to avoid reliance on a fixed IP.
> 
>> -- 
>> zhenwei pi
> 

Hi,

I'm not against redirect mechanism(like iSCSI implementations), but this 
leads complexity(especially to a draft version).

The alternative implementations in my mind of the first step:
- configure Virtio-oF IPs to DNS server. The initiator resolves the IP 
on connecting/re-connecting. (this looks like iSCSI redirection - use 
DNS server instead of iSCSI redirection server, but no additional 
specification definition is needed)
- Or, configure IP list to a initiator, the initiator select 
one(RR/random...) on connecting/re-connecting.

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

