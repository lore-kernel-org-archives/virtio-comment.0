Return-Path: <virtio-comment-return-6774-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA33EB64D9
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 20:41:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A6F0679129
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 20:41:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 813E6986800
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 20:41:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6B66E983B4A; Thu,  6 Jul 2023 20:41:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 55F119867EB
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Jul 2023 20:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: tRGb15fqO-OVjXeDkuU9FQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688676096; x=1691268096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQikHK+IFeXIsrbraOGWzP8vUTFAZoeDUY5hVGdMu/k=;
        b=ZuoMQMwvbL5SkVk0uE7OsTYsx6Bes4S39UtLylq7Hw2ZXEaQSE6ulJ9CIIfVuues85
         hDEB/pcDz8Oac0eRnjx7a1wRhFYL13gUBtu4xyqatt2H62cvoHf7vmNvnDC3vcmTz63f
         bEeqGEfCXaoLKVqPCOPqtDfHfkvbcw+0Lmadsp73TQHaxKHNpivcsgc1x+q4g5ewY7x7
         VvzphC0xrU6DZ5WBOP/sZVlHO0U10CjuoD6+Hrbd6cinYiVxO2idju+/1CTUTqaFOFe4
         0V97aXWU09AB3QIDqhDe4DwLWdTum1HBHUED/za+xaFlj7LGtCKiMXR3yVNKYI4IX4hS
         lDPw==
X-Gm-Message-State: ABy/qLbAeL+uZ3xPS/HVHCqg7mateIcVCrgYO6+vrxdazarKI6OVjo5m
	IjsFsfVjL69WVkDiECv3uSI0L2J2JlnPNdMIBvj/7r99XeEqjfhWLE3Qvw5negm7oPdHda8foHW
	6WJmigzME6bEOaistOxnltBzQFO/nOGX9Aw==
X-Received: by 2002:a7b:cbd9:0:b0:3fb:ac7b:4930 with SMTP id n25-20020a7bcbd9000000b003fbac7b4930mr2215197wmi.3.1688676096196;
        Thu, 06 Jul 2023 13:41:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEvUIgIXQjqu8mftYnGGBmLrOVTeIaT3mfAdH62qazyJC2oM5e863SrqfgRWdPZNM6Izk0j9w==
X-Received: by 2002:a7b:cbd9:0:b0:3fb:ac7b:4930 with SMTP id n25-20020a7bcbd9000000b003fbac7b4930mr2215183wmi.3.1688676095911;
        Thu, 06 Jul 2023 13:41:35 -0700 (PDT)
Date: Thu, 6 Jul 2023 16:41:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230706164028-mutt-send-email-mst@kernel.org>
References: <20230706135858-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B845ED0FDA919B822941DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706144427-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817A61E0062B9BF3401836DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706145538-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481074A79C630384382CB20DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706154002-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AF3000FFDBA2CBA5D7ADDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706162505-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B7E0DE415B1489818DE9DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481B7E0DE415B1489818DE9DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v10 4/4] transport-pci: Introduce group legacy group
 member config region access

On Thu, Jul 06, 2023 at 08:35:37PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, July 6, 2023 4:29 PM
> > 
> > The driver has a final decision. Let's make it a SHOULD and then if driver knows
> > best then it has the choice?
> >
> 
> As you said, the driver has the final say.
> There is really no reason to complicate the spec for a narrow case where device cannot judge.
> 
> > 
> > > > But I don't see any configs where leaving this to the driver's
> > > > discretion is preferable. If you see one let me know.
> > >
> > > In doesn't need to be config.
> > > It is the environment that chooses which is preferred by the driver.
> > > For example preference of accessibility over ordering.
> > 
> > 
> > what does accessibility mean exactly? I definitely see OSes where owner driver
> > can't access a member.
> Accessibility = access a member
> 
> > So in that case naturally driver will skip the entry for member even if it's first.
> > maybe there are configs where member access is possible but is very slow e.g.
> > with lots of indirect function calls?
> > OK fine, but then it will be up to the driver to test and make damn sure the
> > benefits outweight the costs.
> > 
> > IOW it's a hint for the driver. If you like you can say it explicitly even.
> > 
> Device doesnt know anything about those indirect function calls, so device cannot hint about driver environment.
> 
> Can we please avoid this over engineering?
> Interface has the doors open for driver to make wise decision depending on its environment.

what if driver can access both with the same ease? this is the
case that bothers me and I think it's practical since it will be
common on linux.

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

