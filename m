Return-Path: <virtio-comment-return-7981-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3D5C25B48
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:18:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D8B982AD57
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:18:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C1966986A57
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:18:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AD25E986A4F; Thu, 26 Oct 2023 09:18:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DB56986A50
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 09:18:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1e5Rn9L5N9CWaGxH4mAYhw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698311887; x=1698916687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Do8guORWGtOZrscs5th3AHtN3uw4mDTJO9vTw3IyWGk=;
        b=JCIIauY3sDjO6whlenM0Vg10FKh1kMWLceujRujSio12ae3mVs8dU1Dbqutiy6CLiO
         xI1ZLoJwfspH1seTU0/wwBhBJw71+c8d79rNhjg0IpvAX5QYvOUl9DN3FtyhZwZmcAll
         RNexka0YQhOChFT1JmRZw626ZQmTZfMrTy5NwTLN34Zd/hmiuVdJntDXyPLrJAlWhxiE
         i+XilOItLYyzoCbZIErcAmCQOt4XYGK0UDwNGDVLSy4w9Z4jnpMRyEFnktuGlVYgvFcV
         /QMuGRsBQXIQaVUhf3yNGUqQXhghs4RFaLl9GiPtnOuxfwxosDkmU9JF6gideWyEfGzd
         fwsQ==
X-Gm-Message-State: AOJu0Yy08oXfbLBGXhpjED4nEPsh1BRPVInOZ077u7KVBb19HLRUmY8W
	sD4osZYWff/Uj3AzzK028KPMRZccyXy6Ws97ML0YUxTO43BcOn5vCpjWprb7rQ2BKOCnsKbISjD
	Mv8Sh0bz+ovY9Y2T7hxwWPrxsA3jiBHWLdA==
X-Received: by 2002:a05:6402:7d7:b0:533:26cd:37c4 with SMTP id u23-20020a05640207d700b0053326cd37c4mr2082568edy.11.1698311887789;
        Thu, 26 Oct 2023 02:18:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElf9ffVUUF31cLJW4Go3IWNE7Odt82kOaMHoaFgGc9eNtUvU0IXcmZt+i3nbjsiuBjhMxJOw==
X-Received: by 2002:a05:6402:7d7:b0:533:26cd:37c4 with SMTP id u23-20020a05640207d700b0053326cd37c4mr2082558edy.11.1698311887528;
        Thu, 26 Oct 2023 02:18:07 -0700 (PDT)
Date: Thu, 26 Oct 2023 05:18:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20231026051556-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
 <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Thu, Oct 26, 2023 at 08:38:51AM +0000, Parav Pandit wrote:
> > 2 can be solved if we allow resetting a queue before DRIVER_OK, 
> This is just the hack of enabling and reset for no apparent gain.
> Future devices may have many queues and enabling 1000 queues, resetting them is just an ugly interface.

Yes I can't say I love it either. The main driver is to try and make it
possible for device to know in advance the max # of queues that will
be used. We could alternatively just add this in a config register
maybe?

-- 
MST


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

