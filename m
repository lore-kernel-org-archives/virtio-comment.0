Return-Path: <virtio-comment-return-7985-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03ACC25B48
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:27:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 04B4426A34
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:27:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0088B986A5B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:27:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E95E0986A4F; Thu, 26 Oct 2023 09:27:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA7F5986A50
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 09:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: sOL2_imoMaydR1Wq-dKCDQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698312460; x=1698917260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7hBWu3pwyydRz5ZzqzGR0r1ojmUvCkZoQaOEaApPjg=;
        b=TyHA//qUTrU1DnyO8UGX+bXsyRhNfU9YrDt2ChJn7b0ZkIlLubgi6bMty8T4zgjewK
         wZgxVbDexnm7/A+25wP93KSCzPSpI/ytgQnNiWXn+Qll+573itG9zbXamNdY+AyqA03U
         W5ETGwk0eu92+6W61mVkJzwaAnUbrmwYfgpPzgbCbRLtPFGnlrY5KUEFS5CnWyv/b2ge
         KIny3SsBjE2tAEzBAESRgxldHf4xw0Y7Ld/NqC/gT9mvxF1VNk4TYcTEeXlVe61/6fJ+
         4I4Uwrz8Qs9Dq7Ro04pne3rets586TNDMuk5zpcLKWGa1uIBPagYhHvGWhTO6ywYgUUI
         SAGw==
X-Gm-Message-State: AOJu0YyqqqkEDHgYvLQyxZa+OtPxVBDRDcA5IgTNpxpXQDIjfohQZimX
	UcMPvPSIZogV3/HfUFtgoPIUGqcYzCXJBekRUqfGX4u8Aqvl6eabn9A9txgzWHJsnrN+eZdOZ+s
	qELKp6JG9K0SblkvKsc/XGjNgJSmUgGB7zg==
X-Received: by 2002:a17:907:5cb:b0:9bd:a34b:eed with SMTP id wg11-20020a17090705cb00b009bda34b0eedmr14795062ejb.59.1698312459820;
        Thu, 26 Oct 2023 02:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO5+MTErhi5ow0Q0HXbStcanDrrKKFw6UeGc8AqiTEwWLk6bxY1E0rnfUrVXVw/eAN6+Xsuw==
X-Received: by 2002:a17:907:5cb:b0:9bd:a34b:eed with SMTP id wg11-20020a17090705cb00b009bda34b0eedmr14795050ejb.59.1698312459457;
        Thu, 26 Oct 2023 02:27:39 -0700 (PDT)
Date: Thu, 26 Oct 2023 05:27:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20231026052637-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
 <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026051240-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548176388094EBC243F879DBDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548176388094EBC243F879DBDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Thu, Oct 26, 2023 at 09:24:06AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, October 26, 2023 2:46 PM
> 
> > > So, this will still provide the unified approach when/if needed on other
> > devices.
> > 
> > What do you want to know? Whether dynamically adding/deleting queues is
> > useful generally? For example, queue per CPU is not uncommon to avoid need
> > for locks. In the presence of CPU hotplug, the natural thing to do is to
> > add/delete them.
> So for those devices who care for such performance, it is reasonable for them to have the cvq providing channel for complex and dynamic commands.

Again, let's please not waste time adding this piecemeal to each device
type, this is clearly a generic thing that belongs in the core.


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

