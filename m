Return-Path: <virtio-comment-return-8359-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623BFC07548
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 07:58:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AF004749ED
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 07:58:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8189F986D9C
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 07:58:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6498A986D99; Wed, 15 Nov 2023 07:58:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 54510986D9A
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Nov 2023 07:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: UVptHd3bM5uLaQNxJlX0oQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700035089; x=1700639889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+L32pS9VvVR3cShEIA/hAHrl62Mv1eToEj2B92eJCs=;
        b=acgBSc7Cat7trt/8Q/78N8Mgf7PW29IPwhSw2tDs8sv/flr8iPG4k+OM+I5lM6NP3Y
         pwep6Lh/VQcOy/sKll/rZLnkiJ+uGMUbGmugroLltwzwdD8v8+wqlb3PNH1XmFFOzRLu
         7FbI/xw7Q9CbQh6iJwT/ytZv9I0tq6adAT8r/OgC3+HN/HUmvY9UXkei2RP/GG3komu+
         m2CDnQbMdC+VM6F9psv6sHqaJYPs7zafU6iNEpFzoaJ+cWZtoPOwhFxMEv9HLmLBHRPL
         xAHIzvtguwmi0l/S1+6jktoex6vSKzQj5rlnWDRboUOwgGmrq9S9cMQB7Rap5WuqgifZ
         Hcyg==
X-Gm-Message-State: AOJu0YxoRUv9ngWE5mbDeoSQd30sabhsCq69u+V+ngQXQySDs/3D8+ux
	fpmpNx8DKMgw//UNLny7gyQ2rGCl0lrGIY90N/DTUaEWNs4CS6dp4qp7sle2NsEfNPtPAVQ4My2
	VV8kHsniZI1Vp8YtsgX6CSVog88eddTYj0A==
X-Received: by 2002:a17:907:770d:b0:9ae:5120:5147 with SMTP id kw13-20020a170907770d00b009ae51205147mr7233714ejc.38.1700035089511;
        Tue, 14 Nov 2023 23:58:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFj41AOE3q+6FDDYruIrKUxD2tjvRTm/Wf1T3X+4Netxy8+LI/WRvVSTuEcgxM795MBX7Qhgg==
X-Received: by 2002:a17:907:770d:b0:9ae:5120:5147 with SMTP id kw13-20020a170907770d00b009ae51205147mr7233699ejc.38.1700035089215;
        Tue, 14 Nov 2023 23:58:09 -0800 (PST)
Date: Wed, 15 Nov 2023 02:58:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231115025615-mutt-send-email-mst@kernel.org>
References: <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Thu, Nov 09, 2023 at 06:24:56AM +0000, Parav Pandit wrote:
> Once PRI is enabled, even without migration, there is basic perf issues.

So you keep saying this and this gives the impression you have a PoC
that you tested to check performance based on admin commands.
If so that's great because one of the main points here is performance.
Could you share these numbers? And, could you compare to shadow
vq based one which is upstream in qemu?


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

