Return-Path: <virtio-comment-return-6921-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD41EB64DD
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:35:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6584E6D07
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:35:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4FF9A986383
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:35:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 375C3983EB2; Mon, 31 Jul 2023 02:35:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 587AC986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 31 Jul 2023 02:34:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690770853; x=1691375653;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rNi3zq37/9qgqzrY3ERat6pUbxj98Wf0b629gdCeUSs=;
        b=KVu5exrxhar7ilrl2JIm7tQ7RbwKlki2hvWXF4TnC1/yHOcFw4BETqXdwuOa9aPUqO
         I90c8UMJJe+cx7G4boTQwPRBBk9qmsCJX5jNOdLDcNQ2vnlpJpk3AXHY8RwWHGU9tXfF
         UfSqiAhixgD40qbkva5JR2P6I2uKeem/+vnHx2taqTzTOgb02TIK4KPCDn7U/m6Zy7bs
         E577z9xtlV2q9gLWiINly065eTpVtowihmU70ZSNOIdj9Kw60ukWz/dZG5XT6Wf1tGpx
         1hZ7fWRIDSCNw1DXBPLJZ3CicW3c58eLcPLHHa4Tx+Me5wbDQ5CcJrKQWlY58vKW5mI1
         oJ5w==
X-Gm-Message-State: ABy/qLaCfucykicz7mINOZvT/6xjVB3eTlESngfawt3VX9cL/agvXEf8
	9gk5AngExuHDwDJ8/OHi66sf+w==
X-Google-Smtp-Source: APBJJlHEY0JLiQ05z8n7rPs1BxfYC32oatv2yUMi6UfQM7ZIs2EVukPniRG4kYa69qnYv8snyUm9zg==
X-Received: by 2002:a17:902:e88e:b0:1b8:b459:f47a with SMTP id w14-20020a170902e88e00b001b8b459f47amr10439075plg.34.1690770853616;
        Sun, 30 Jul 2023 19:34:13 -0700 (PDT)
Message-ID: <be483647-00db-7529-0632-60ace98efd72@bytedance.com>
Date: Mon, 31 Jul 2023 10:34:06 +0800
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
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <F0CEEC0A-4087-4BAF-B0AB-E56EF078457D@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Re: [virtio-comment] [PATCH v4 4/7] transport-fabrics: introduce
 command set



On 7/30/23 07:28, Raphael Norwitz wrote:
> As noted in my high level feedback I think the protocol should have redirection semantics.
> 
[snip]
>> +\end{lstlisting}
>> +
>> +\paragraph{Connect Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Connect Command}
>> +
> 
> This would be a good place to introduce some kind of target-side redirect mechanism to support redirecting to another IP.
> 
> Probably just another op/status code and message from the target for redirection?
> 

Redirect mechanism is not used widely in my practice. Instead, multi 
path mechanism is used a lot. Would you please share your experience on 
this?

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

