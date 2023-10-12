Return-Path: <virtio-comment-return-7675-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D23BCDB482
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:06:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BBEA888E10
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:06:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7BEA098683E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:06:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5B1CB986474; Thu, 12 Oct 2023 10:06:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4AFE098660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 10:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: lQEf5LoHMxOZPY8EcmiqRw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697105185; x=1697709985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCRmI1q0ROw09CpXNpcaEpz2HZAd+YE53Ix/H164du4=;
        b=nMRcXOxpuYxx0SPodm0IAA5QwyCASyb0Y0ofyIEfUSWK55VplIZ3gdau+hXaQLXqeG
         p2h00ka3teLT75zOSUnYgioN1lUTXth/AAlez+bhUpUqnDzrEeSqai9vIN8sR2ELhqyE
         B3YqQngXLCsb48vDHRnNanKMOgmtB7olu3F2Z+N39m8Mk3KR2nqWY20+zYdAhHkggNAW
         XGLGeSxLa4gxwX0H7ab1fRUVuEZOSzbEqTfal8eDLg4oF6CbChEakK8xCXNPDwIfDYXm
         ykikScq/H+hitH5hTCB6F2Ew3vZU9jyQkKjsLstIg15Xb/BG0QzAEyppDJki9IbGUgem
         IiUQ==
X-Gm-Message-State: AOJu0Ywnc/T91MTTqu+TU88WnX3ZZHG0gMtb9PqME3k2AevalbkNxsSD
	9SXgjB4tfa6z+znIcsohyK2vB8ouKF4NGWKL2tvpO0V42AIGhlvFhMiVj3N7txrJdGBTHQaUiX+
	UvpyInOE6exiLWs5ZIyth8i1czyeNN6ZJMA==
X-Received: by 2002:a5d:56d0:0:b0:31c:5c77:48ec with SMTP id m16-20020a5d56d0000000b0031c5c7748ecmr19145364wrw.62.1697105184823;
        Thu, 12 Oct 2023 03:06:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpo4XyPr8jINhzge3Gzk4K3DNI4C3d5kZ2Xf6h9ZpjYVrfgxHikm0rrkqychyiz3OdZFrkcg==
X-Received: by 2002:a5d:56d0:0:b0:31c:5c77:48ec with SMTP id m16-20020a5d56d0000000b0031c5c7748ecmr19145343wrw.62.1697105184488;
        Thu, 12 Oct 2023 03:06:24 -0700 (PDT)
Date: Thu, 12 Oct 2023 06:06:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231012060413-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
MIME-Version: 1.0
In-Reply-To: <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Thu, Oct 12, 2023 at 06:00:09PM +0800, Zhu, Lingshan wrote:
> we are talking about nested, don't break nested

Yes, and I agree a "simulated VF" is a kind of hack
at least for now. What I could see instead is
one or both of
1 another way to submit admin commands without DMA
2 a way to have a "dummy" PF that only does admin
  commands without anything device specific


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

