Return-Path: <virtio-comment-return-8025-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B830C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:02:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B8DAB45B29
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:02:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9FFBF986B1A
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 04:02:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8F6C1986A42; Mon, 30 Oct 2023 04:02:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7FAF3986A7E
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 04:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: mWPE-rWdNii7r_fQ6lH-Dw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698638542; x=1699243342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqwB93L658BvqptG9bhSVd4FoAiREH8hGcjejQMZAR8=;
        b=Y2mjEtF7WFZh/+AzoLjNRC7nqNk20usm1MhzN4F06BJ28q4flxfE9XQle5y3LrpFt4
         iM4LJG5Q6fLEQNkQ3KuN7ecX8j4FjaVuZj5gqCgBsdxzlUpE2D6x87q225Kahe8Hsuwc
         aVLtM86Ta6SUcXNqgm69Juty4LUvu16TnxlWIQU+sXMSLsLR0q+CySi10g8UfqfmabDb
         ohHrpNGZKmK7PfDOw9/wbaXX11FFPzwrlUbhIgmL+Mk0J8CgdA8yA8iTN1ufcc3aBSCi
         FOUNtoGRQybfylfvdC6HWfuGl6bZngyi6ytlkTDMSsph3/0eGx0DxnDw4PidISWOIMNl
         3I/g==
X-Gm-Message-State: AOJu0Yz9OBiNK9QyxCnP7e4kXN3rCpWJoiCVc0ZxC6O/zp/BQvWW21HI
	EvSe2+4XCS7ncvfi2DNqaQjY1zFFxSx4o/tTTshAMG085eC77C40x92Za+uvsA4PX567y0sJOt3
	+u7DkymND0WJd0sK340Hp27qQgR/SjkY8eg==
X-Received: by 2002:a17:903:1110:b0:1c8:9832:827f with SMTP id n16-20020a170903111000b001c89832827fmr8708537plh.20.1698638542034;
        Sun, 29 Oct 2023 21:02:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx1Gtw6wzFWeTd5p8TJcOYCpkSxBOWxRev6xFPWhKB5nG4KtrMhUGEZP8um5Alc1NbtvIvuA==
X-Received: by 2002:a17:903:1110:b0:1c8:9832:827f with SMTP id n16-20020a170903111000b001c89832827fmr8708523plh.20.1698638541713;
        Sun, 29 Oct 2023 21:02:21 -0700 (PDT)
Message-ID: <d8838c62-e970-ed7d-e5bd-3c24a56eeb56@redhat.com>
Date: Mon, 30 Oct 2023 12:02:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Parav Pandit
 <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <20231021112420-mutt-send-email-mst@kernel.org>
 <2cc0d8fc-8ed5-4b98-b5e7-3a86d3da80b0@intel.com>
 <20231023072519-mutt-send-email-mst@kernel.org>
 <8d601578-2083-4f45-a700-6b67d0c5b789@intel.com>
 <20231025042512-mutt-send-email-mst@kernel.org>
 <CACGkMEtaw-DKy7vwWj8wgG8-_9Kg4SV3=pS1djntOEYM62Dg-g@mail.gmail.com>
 <20231026020352-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20231026020352-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration


在 2023/10/26 14:22, Michael S. Tsirkin 写道:
> On Thu, Oct 26, 2023 at 08:56:47AM +0800, Jason Wang wrote:
>>>> We transfer data by DMA, the device writes DMA dirty pages information(bitmap)
>>>> to host isolated memory region.
>>>>
>>>
>>> If you do that then I don't see any reason not to use admin
>>> commands for that - either through a vq or a simpler
>>> interface.
>> I think we need to agree that admin commands are the only interface
>> for any future features before we can have an agreement here.
> I don't think that needs to be the case. I do think that if
> your goal is a separate channel from normal device operation
> then this is what admin commands have been designed for.
>
>> My understanding is that it is optional for the transport that
>> requires administrative commands like provisioning etc. It is not
>> necessarily the interface for new features.
> Yes. And migration is IMO sufficiently "like provisioning".


To me, this looks more like a transport. Hypervisors can trap and 
forward it to admin virtqueue. This somehow duplicates with the idea of 
transport q over admin.


>
>>>
>>>>          Config space interfaces are fundamental for virtio-pci.
>>>>
>>>>
>>>>      They are in fact fundamental to virtio. Multiple transports to
>>>>      use config space are also fundamental.
>>>>
>>>> I agree. So I also agree to build admin vq live migration solution based on our
>>>> basic facilities, as Jason ever proposed.
>>>
>>> I'm not sure it's even a vq. I suggest a minimal interface to send
>>> admin commands. Could be used by migration, as transport, and more.
>>>
>> It's better if we can do that below the layer of admin commands. For
>> example, we don't stick device status with any specific interface. We
>> can keep doing things like this.
>>
>> Thanks
> Could go either way, but complex functionality like live migration
> can benefit from a rich interface.


That's my understanding as well.

Thanks


>


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

