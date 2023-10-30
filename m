Return-Path: <virtio-comment-return-8024-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B1DC4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 03:59:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0185442A68
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 03:59:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D7F9D986B1C
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 03:59:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BB545986A42; Mon, 30 Oct 2023 03:59:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A8172986A7E
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 03:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 773tcDmPPqyAXL6He8sMDw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698638380; x=1699243180;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4h0QA7hzVw1h5bVBTYDlRAG4sXB/WGES9w9woPduhS0=;
        b=Zi3V6IEFHWFnmK9i1rQx1qRaaD2RmTSZA8GcIV7WHP63LnGEZstUqMMiGbWZAoEI7O
         Tl4kq2WBm8z+Quff+EwWBXoj40r/OYD0SbP9N8BosRhMohZ75PW53mq2IJYagaeMLCCV
         EDmFPC2fqTKDmULG3ByA76YCkOG8Y9203t6ySGcavQhFX6mu3V1HKQS+YEQMHBd0QFHY
         ThdP1npJDzqRb+qqEpPBDPPd01ZU0YFcGMqlpr1/B+Csa41aHr/zyBXAw7XpHKM4cDns
         tFutY3wr3/vBwLwX7xK7SSv6dcsUieqVQFpOjFaoXNIWS6pEDkoCA9SPETE/ChvQLW4J
         X3OQ==
X-Gm-Message-State: AOJu0YwqQWUGcWKqueyLcA6sh8pkf8EPgUJwvydIo1Z6X4aleqa2TzhR
	fsCOpmy0qMiSI+I+1Hfp0/oS0v+bSNRACTjVZeOlViF/ulV2YrKIrs5LfFl4kh1ELL2T6iS+28G
	cEmpCJgrhdJ2HbwRQLADNdUlTux7pquDTWA==
X-Received: by 2002:a17:902:c411:b0:1c5:bc83:557b with SMTP id k17-20020a170902c41100b001c5bc83557bmr8261890plk.51.1698638380119;
        Sun, 29 Oct 2023 20:59:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyKPv9aL3+L0LZ7uYcUeGlr/HLKwfS6g33GRVqf2j4xCET8VrcWMhteHoAzz6RZWzsf2k1ew==
X-Received: by 2002:a17:902:c411:b0:1c5:bc83:557b with SMTP id k17-20020a170902c41100b001c5bc83557bmr8261876plk.51.1698638379808;
        Sun, 29 Oct 2023 20:59:39 -0700 (PDT)
Message-ID: <629f2434-03b8-1fa2-e217-97a00cd94c2f@redhat.com>
Date: Mon, 30 Oct 2023 11:59:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <20231021112420-mutt-send-email-mst@kernel.org>
 <2cc0d8fc-8ed5-4b98-b5e7-3a86d3da80b0@intel.com>
 <20231023072519-mutt-send-email-mst@kernel.org>
 <8d601578-2083-4f45-a700-6b67d0c5b789@intel.com>
 <20231025042512-mutt-send-email-mst@kernel.org>
 <CACGkMEtaw-DKy7vwWj8wgG8-_9Kg4SV3=pS1djntOEYM62Dg-g@mail.gmail.com>
 <PH0PR12MB5481E50E25268163CD85751DDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <PH0PR12MB5481E50E25268163CD85751DDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration


在 2023/10/26 11:58, Parav Pandit 写道:
>
>> From: Jason Wang <jasowang@redhat.com>
>> Sent: Thursday, October 26, 2023 6:27 AM
>>
>> On Wed, Oct 25, 2023 at 4:33 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>> On Tue, Oct 24, 2023 at 06:27:04PM +0800, Zhu, Lingshan wrote:
>>>>
>>>> On 10/23/2023 7:32 PM, Michael S. Tsirkin wrote:
>>>>
>>>>      On Mon, Oct 23, 2023 at 06:03:10PM +0800, Zhu, Lingshan wrote:
>>>>
>>>>          config space, MMIO, registers work for years, what is wrong with them?
>>>>
>>>>      Nothing as such. They don't seem to be appropriate for all use-case
>>>>      where people want to utilize virtio. I think a new transport
>>>>      will be needed to address these.
>>>>
>>>> New transport for new type of devices for sure, like transport vq for SIOV.
>>>>
>>>> I agree admin vq or admin cmds are useful in some use cases, that is
>>>> another story, should be case by case.
>>>>
>>>> For now, let's don't talk about all-use cases, just for current
>>>> task, for live migration.
>>>>
>>>> So IMHO, I still think we should use config space registers to
>>>> control live migration process.
>>>>
>>>>
>>> No because it forces integrating migration process with device driver.
>>> Which is ok for some use-cases but not all of them.  Find some other
>>> control plane for this.
>>>
>>>
>>>>                  Config space is control path, DMA is data-path, let's better not mix
>> them,
>>>>                  we never expect to use config space to transfer data.
>>>>
>>>>                  So we need DMA to transfer data, for example I take advantages of
>> device DMA
>>>>                  to logging dirty pages, This also applies to in-flight descriptors.
>>>>
>>>>              As long as you do, I personally see little benefit to retrieve parts of
>>>>              state with memory mapped accesses.
>>>>
>>>>          registers only control, and I personally believe a single register is much
>>>>          better
>>>>          than processing admin commands, more light-weight, more reliable,
>> working
>>>>          for years.
>>>>
>>>>      Yea. It would be, if we could do everything through that register.
>>>>      But we can't really. Migration has too much data to pass around
>>>>      for that to be reasonable.
>>>>
>>>> data are not transferred by registers, they only control.
>>>>
>>>> We transfer data by DMA, the device writes DMA dirty pages
>>>> information(bitmap) to host isolated memory region.
>>>>
>>>
>>> If you do that then I don't see any reason not to use admin commands
>>> for that - either through a vq or a simpler interface.
>> I think we need to agree that admin commands are the only interface for any
>> future features before we can have an agreement here.
>>
> For passthrough member devices, this admin commands to be transported via the owner device by the migration driver which sits outside of the guest VM.
>
> If this basic requirement is not clear it's pointless to discuss further.


So my question is not limited to devices that is modeled as group/owner.


> How is the passthrough device defined? It is defined as [1].
>
> Can non passthrough device modes such as vdpa also use these admin commands from the owner device?
> Sure, why not?


That's fine but it's not my question again.

Thanks


>
> [1] https://lore.kernel.org/virtio-comment/PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com/


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

