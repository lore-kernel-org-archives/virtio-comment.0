Return-Path: <virtio-comment-return-6002-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAE4C77B73
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 21:42:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6E0B2190928
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 21:42:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D34A59867D2
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 21:42:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 376739863FC; Mon, 22 May 2023 21:42:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14072986412
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 May 2023 21:42:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8CaN-FniN1CpIfUrDQv3dQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684791745; x=1687383745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPyfDq7gA4ccov8f6eTG9vSXbG3sNt1/GtetsPasXKg=;
        b=JqOmmZcuDOxIoePXlbqgZz2/PiPneufrNVYnpxhyzkMsSHDdbV6tnNPUKrho9dzNTx
         dcZd8Nwr5/85hVR3UJvV7HF0VXwpFIkVugCjc5eqhGn3dndnOkOM0gvH5pWcrj3j6cDl
         fKfWzQ5fwSxXM8OHmtVR7OlGTsgp2cM9Tx0dC8UTmSbnqoy3Ph/zgX+XPfGTmY2dlzAh
         F+JXDfYxLJ1KIp18cUC4fkGxwWVMvuJ/1Lb2/S6gAa5ziE6nAkaPQ+VbKCh3Mpl81J6x
         Kwo4NloGMBibVtBU12KIZHzkaUklU4xyOfQ05l5x8iBuyZjx1CxYSA+a/qs1cv86kYZf
         7FOw==
X-Gm-Message-State: AC+VfDx2d45nh5IZjp0ulTzWUUt2UFikDdg5qDyqxlUTxRzUCdd3urRC
	NbbL+KscHdqBBjaoFdi/fc5reMwupOxaTl1wevGL/mxEzdKIFYWwKNKEoQ4snMtsHxgaQDbh1jJ
	+OkUAlcwI8paat02cFNDhOMwe1Y8YpjiadQ==
X-Received: by 2002:a5d:5448:0:b0:309:507f:3f22 with SMTP id w8-20020a5d5448000000b00309507f3f22mr9329423wrv.37.1684791744919;
        Mon, 22 May 2023 14:42:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ66RGd0pVix8+zCu2m2ucy/qzokNu97OTGY1TsYztOITl6a5AP9fAW94eDb5r8n1K7l24pdPw==
X-Received: by 2002:a5d:5448:0:b0:309:507f:3f22 with SMTP id w8-20020a5d5448000000b00309507f3f22mr9329414wrv.37.1684791744625;
        Mon, 22 May 2023 14:42:24 -0700 (PDT)
Date: Mon, 22 May 2023 17:42:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230522173946-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54817CBB98900B83C4F30164DC7E9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230518153640-mutt-send-email-mst@kernel.org>
 <20230519015520-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AABA8A22DC088B5D7CFDDC7C9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230521050829-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548161A2D28C387C9AF23B81DC429@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230521102050-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815D83C3287FE7B3A2947CDC429@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230522154149-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481A2AD326E7F0A7CEFC223DC439@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481A2AD326E7F0A7CEFC223DC439@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v2 1/2] transport-pci: Introduce
 legacy registers access commands

On Mon, May 22, 2023 at 09:05:13PM +0000, Parav Pandit wrote:
> > How was I supposed to raise this issue on v1 if it was not there?
> > Stop arguing in circles and things will move forward.
> v1 version clearly had AQ commands.
> 
> Please revisit your comments.

Just for fun, I did look it up, and there I asked:
	What is this notify offset? It's never explained.

so yes, it was there but without explanation, only technically.

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

