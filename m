Return-Path: <virtio-comment-return-5895-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25354C7EE24
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 07:30:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4D8E7F9362
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 07:30:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4036E986430
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 07:30:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3198898635A; Mon, 15 May 2023 07:30:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F11598636A
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 07:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wm8h_7kBN_WEX2VCd72wHw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684135855; x=1686727855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74J+9nUvx7fAMDOYx+zxq20d3gkbLbZP3fe6J2gYXkU=;
        b=fUt6hlfoIKKgZ4oisXNFlH/r++wb/eVypY8LcS3Kw9qT7OLkX+bt+i/+iaC0mo4kPF
         zO2ajGRVtnBBRzvGfBEgWPflO/m1kuWGmA4uLKNltvMdIFWdO2a3PHN2aEHZFyuRBbrf
         8R7WvbrJQju4ra+KiiVH+ErECU8T2No2C3wEeNSwlt8C/P4AVKBhde7ojJ7cucy5Bul9
         iGtk03+Q+FKi42N5VDrpUWYSWMgRi9DUUvztJqDw/omQ/+BUM1D/CulD1xmBNZR2ve/E
         xK/6MEiCQijWiKsW/KMZYCqE5wgXUjvW2htMepjinuHshMfT9KroLzVlSfyLGrWEv8RS
         mFbg==
X-Gm-Message-State: AC+VfDx5iXzyNskJNnrAIgfK9rR9ylJ9MEM7ozP9vVwUvFZVNtdNDpJV
	MAVypFbzdnOndRPZ/GCLYqDV72xQB28OoEGcLVCtJj9f5PVRDRfet6pb3YTjuApsfjx62y+86IC
	Z+yeyJOlE4uyYlxftNj2UpnqX5JOkpg+meQ==
X-Received: by 2002:a05:6a21:32a8:b0:100:60f3:2975 with SMTP id yt40-20020a056a2132a800b0010060f32975mr33469233pzb.4.1684135855183;
        Mon, 15 May 2023 00:30:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4oDfoeyk25oQkcCj5/EJEDiLL6CU4x25zeQtEPMdwv6b7fwqmpwbu4D2FMLlhbpUYT0B1RAg==
X-Received: by 2002:a05:6a21:32a8:b0:100:60f3:2975 with SMTP id yt40-20020a056a2132a800b0010060f32975mr33469213pzb.4.1684135854895;
        Mon, 15 May 2023 00:30:54 -0700 (PDT)
Message-ID: <0f75a142-71e9-676a-11ae-a54e6dbb472d@redhat.com>
Date: Mon, 15 May 2023 15:30:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
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
 <20230510014534-mutt-send-email-mst@kernel.org>
 <CACGkMEvTs9oMewgrQpYZu1v1wdUXtxsvjqB6CPRf+y4C8EN_KQ@mail.gmail.com>
 <20230510033812-mutt-send-email-mst@kernel.org>
 <CACGkMEsp0i7EyyBBp06wJzrVBLNbH7MP_TT-j7b5c_yavgAmqw@mail.gmail.com>
 <20230511085205-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812F2EFEC7B6A235953A82DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <PH0PR12MB54812F2EFEC7B6A235953A82DC749@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce legacy registers access
 using AQ


在 2023/5/11 21:02, Parav Pandit 写道:
>
>> From: Michael S. Tsirkin <mst@redhat.com>
>> Sent: Thursday, May 11, 2023 8:55 AM
>>> 1) device features
>>> 2) driver features
>>> 3) queue address
>>> 4) queue size
>>> 5) queue select
>>> 6) queue notify
>>> 7) device status
>>> 8) ISR status
>>> 9) config msix
>>> 10) queue msix
>>> 11) device configuration space
>>>
> #9 may not even go to the group owner device.


It the config_msix_vector register so I don't understand why it can't 
work but can work with your proposal.


> What do we gain from bisecting it?


1) No need to deal with the offset in the hardware

2) transport independent

3) avoid duplication with the (legacy support of) transport virtqueue


> Every new additional needs involvement of the hypervisor as Michael noted below on "effort" point.


I'm not sure I get your point.

If additional effort is not wanted, we need a full PCI over adminq, 
that's what I suggested, then we don't need any extension for any new 
features probably.

If we choose to invent dedicated adminq commands:

For legacy, we don't need any new additional effort since the above 11 
maps to the legacy virtio-pci facilities.

For modern, if the feature is something related to the transport, we 
need new transport interface for sure.


>
> The register offset and read/write is far simpler interface for hypervisor.


If this is true, why not go full PCI over adminq? Hypervisor in this 
case even don't need to deal with config space.


>
> Not to do cross register access is what we need to define in the spec for 1.x or future things.


You can't assume the hypervisor behaviors, so the device or at least the 
spec should be ready for that.

Thanks


>
>>> It focuses on the facilities instead of transport specific details
>>> like registers (we don't even need legacy registers in this case), I
>>> gives more deterministic behavior so we don't need to care about the
>>> cross registers read/write.
>> This needs thought, it is definitely more work.  Effort that could be maybe spent
>> on new features.  What is the motivation here? supporting legacy mmio guests?


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

