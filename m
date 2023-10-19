Return-Path: <virtio-comment-return-7851-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64CFCDB483
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:15:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2F3377786B
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:15:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 168589868D5
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:15:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0AEA79868CE; Thu, 19 Oct 2023 09:15:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F00329868CF
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:15:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: eNjKlqQbO8KDl-e3qqeYrA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697706903; x=1698311703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvQOKEIxrtnAs/c81YCzLgmy3VM0VdfplRzGk+65HzA=;
        b=RJrHEbWX2l7qB1GtijoMJjChKCRN15N6Xg5EwjrYYzgrXfhYeMmOVkha3gLhSXAwqA
         OAtMn/TkJrumIh6alx1PssJn8SPycWFuDxo3+STw81I2uOHnhKEo89eJFFCEJIkRGx0y
         ejDWq8ErAQIe6aWJM6hqTEUjQ1dBlGzCCUa/EichdWPz1sEwGjcRLl2saQVbme9McyrB
         YWydxxfpnA9XRgSG3vlzQKxXb4NCVOOZe7OaZhksw5Ae5j4h4Lcg/8beRf38zUyxowD6
         q02b1XxO17o6CGOS12YHq0BAZy9trBqXN+A3e4iN2yERZVba+lsbcebvpWzLY4CI9aKe
         Eqdw==
X-Gm-Message-State: AOJu0Yxo/7cOfCccKqkJ3jg0d6g+9OVYwC3eKrzajjMF26HJSnUKdRSk
	HBDXkzovzIILleOMgNtPEWQGKW/UNikyYyhuG2xBCd3FYp/0sv2svmU3QVPxjyiGyWW5M5/1Git
	IegnTY1IHNyXlOJ4a1yqZBvBTcFMf4mUCTw==
X-Received: by 2002:adf:ea8c:0:b0:31f:ffd1:6cf4 with SMTP id s12-20020adfea8c000000b0031fffd16cf4mr1034463wrm.12.1697706902802;
        Thu, 19 Oct 2023 02:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0S2iODa61VcW0/bXGpZH9250hNcQH2/rBkvWMjIdBYdz+zkUAmiVP1ldr/DWr9EK803ngyA==
X-Received: by 2002:adf:ea8c:0:b0:31f:ffd1:6cf4 with SMTP id s12-20020adfea8c000000b0031fffd16cf4mr1034449wrm.12.1697706902481;
        Thu, 19 Oct 2023 02:15:02 -0700 (PDT)
Date: Thu, 19 Oct 2023 05:14:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231019051406-mutt-send-email-mst@kernel.org>
References: <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Thu, Oct 19, 2023 at 09:13:16AM +0000, Parav Pandit wrote:
> > Oh, really? Quite interesting, do you want to move all config space fields in VF
> > to admin vq? Have a plan?
> Not in my plan for spec 1.4 time frame.
> I do not want to divert the discussion, would like to focus on device migration phases.
> Lets please discuss in some other dedicated thread.

Possibly, if there's a way to send admin commands to vf itself then
Lingshan will be happy?

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

