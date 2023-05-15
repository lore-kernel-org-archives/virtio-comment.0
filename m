Return-Path: <virtio-comment-return-5890-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9F8C7EE22
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 05:12:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 854272AC4C
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 05:12:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 76380986399
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 05:12:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6DB74986348; Mon, 15 May 2023 05:12:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5AE56983E49
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 05:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: MJeROUuqORK64xz5Camrmw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684127537; x=1686719537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqGYSucWjH3m/t7zcN76j7dLHnGioTQTJUoB1Po7lQY=;
        b=FDUvRZmy1kpMH8iZ0hYKfXoA74FRO8MHxlGIg6rE7plvDszgulS3k8eWGLHb0UpGJM
         tISDYY2vfx/4yf/VG74zouS99cozfCGiJVGMZFsjXkUIoKDBYw8+EMlPZlm4pjLxO2fg
         CcA+4b4dBocvwJaCjOO3d0zBiJFMNHnCVWxEwjFFipZ7d9gpJyE8az5qhm8srIuF+ZdF
         tWZOm2ph/Nwke5gGCBiDeTVwCCAmV2geUC7Pv+ZDOdSyA+E21hesAlB5F1Iay+us4yQ7
         Jzs1Z9iBVW98sAGnTBBckvSj5hWCuZpToUtxTS5qgci4v4lhtEjoBiJPF+xWD13WQVXx
         Wlvw==
X-Gm-Message-State: AC+VfDyIQE0t8ux3MmSi3RwMQZ2Aw0WUCCSPcvNFDwP1Uva7W1thOb9y
	zlVBd/YwVHrQ8+pDucPaAAb3/M21s/MS2bFGmc++vih2x2IsErOp3cq6qUIyGcVl8BacCMYIMUq
	WMknsX6bRwyb1RzlQCtbJ60NKtxPKS8AsbA==
X-Received: by 2002:a17:90a:d988:b0:24e:20d9:4e5b with SMTP id d8-20020a17090ad98800b0024e20d94e5bmr34501307pjv.9.1684127537534;
        Sun, 14 May 2023 22:12:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qiWwZ2eTdruCX+TtQucljuNRqxrEvruGe/IF/kg/QGthMYiyxOXrK6EunEb0gisFwfIRaJg==
X-Received: by 2002:a17:90a:d988:b0:24e:20d9:4e5b with SMTP id d8-20020a17090ad98800b0024e20d94e5bmr34501284pjv.9.1684127537230;
        Sun, 14 May 2023 22:12:17 -0700 (PDT)
Message-ID: <eec75132-fe69-5b99-fd5d-d227257b92f2@redhat.com>
Date: Mon, 15 May 2023 13:12:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "david.edmondson@oracle.com" <david.edmondson@oracle.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Yishai Hadas
 <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 Shahaf Shuler <shahafs@nvidia.com>
References: <20230506000135.628899-1-parav@nvidia.com>
 <CACGkMEt_2B68a+BZ4-vfeDf_eYj5ZhxrDNd6dxuiF85qr0yN2g@mail.gmail.com>
 <20230507093959-mutt-send-email-mst@kernel.org>
 <CACGkMEtfMbcu2OPsH6P2tA1aHh2FKygv=xkJ-e1XQzb62nE1vQ@mail.gmail.com>
 <b33fe999-8491-30b4-5021-589a2fe87398@nvidia.com>
 <CACGkMEsSJVG8mzuo3BH1xQzz5TyNbO+o3GcYwoXchcYVOczTTg@mail.gmail.com>
 <PH0PR12MB5481AC52CCAE9636E17C7565DC769@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu1oU0wzygicS0bApoWuRaWkWsPivKRiq-ghezB=hg+Fw@mail.gmail.com>
 <d79a83db-46eb-7f7e-da8e-f39b58b1bc0f@nvidia.com>
 <CACGkMEsR1bJGWjn7TTrvMZV3=fCqggWXjXRXK179YiTUxVTc6g@mail.gmail.com>
 <PH0PR12MB54819321E95065EBFF7D714CDC749@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <PH0PR12MB54819321E95065EBFF7D714CDC749@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH v2 0/2] transport-pci: Introduce
 legacy registers access using AQ


在 2023/5/11 22:31, Parav Pandit 写道:
>> From: Jason Wang <jasowang@redhat.com>
>> Sent: Thursday, May 11, 2023 3:17 AM
>>> a configq/cmdq discussion is for new features for PF, VF, and SF/SIOV
>>> devices to work in _non_ backward compatible way, because for new
>>> features there is no such thing as backward compatibility between
>>> guest driver and the device.
>> Ok, so what command did configq/cmdq have?
>> I thought it was similar to transport virtqueue, but it looks more like a control virtqueue here.
> Yes, it is more like a cvq to do device attributes discovery and configuration.
> Just that its generic enough.
> For example
> creating VQ that spans multiple physical addresses.
> Discovery and enabling new device attributes which are rarely accessed or accessed during device init/cleanup time.
>
> The fundamental difference between cfgvq to tvq is:
> Cfgvq is between the member virtio device and its driver.
> Tvq=aq is on group owner of the virtio device.
>
>>>>> Compatibility is coming at a cost which is not scaling.
>>>>> If you attempt to scale, it breaks the future path forward to go without
>> mediation.
>>>>>>> So eve growing these fields and optionally placement on configq
>>>>>>> doesn't really help and device builder to build it efficiently
>>>>>>> (without much predictability).
>>>>>> Config queue is not the only choice, we have a lot of other
>>>>>> choices (for example PASID may help to reduce the on-chip resources).
>>>>>>
>>>>> PASID is for process isolation security construct, it is not for transportation.
>>>> I meant with PASID you don't even need a BAR.
>>>>
>>> Not sure I fully understand, but my guess is, this is coming from
>>> mediation thought process.
>> Not actually. I meant, for example without PASID, for modern devices, the
>> common cfg structure must be placed on a BAR through MMIO.
>>
>> But with the help of PASID, it could stay in the memory and the device can fetch
>> it via DMA. The help to reduce the resources for registers.
>>
> Yes, it can stay in memory and device can fetch via DMA using a VQ using its own q from guest driver.
> Why does it need PASID?


Let me clarify my understanding.

If we want a per VF virtqueue that is used by the hypervisor. We need 
PASID. Otherwise not.

Thanks


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

