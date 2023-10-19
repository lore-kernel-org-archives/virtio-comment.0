Return-Path: <virtio-comment-return-7849-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526DCCDB482
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:13:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B43CC747CF
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:13:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AB4B99868DA
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:13:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A12F29868CE; Thu, 19 Oct 2023 09:13:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 93F339868CF
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -o5ow9vENJ6cO0Nk7Hf31A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697706803; x=1698311603;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TuJU9dx6aTnDUK7I0UtYT8ktG3JA1HHH6BfaJCIbHmY=;
        b=EaW6QrM25CF3d1nh6wn+uM9wtyJymRZ2egetbQhdrjqHcNVaWvXljZoYuR+jcZvq0t
         +pS2+PRxdpqc3E3kas8MVV34DJ5vmM2pllbi/VQlpG1U4kO5E7gh1uStV4cPNvHs0apN
         1Qg0FxzPyDX87+4EbATwuQAvTyk01rgKT0Y0qoAd0eBW7qjeXEKtAsBjAOOTJmz7jDCt
         LYTzWHlART/bpbqh7dtTvTZHcK+Q7+UZYbrn8fkRGEC3m2b7PRTr7dXw1va2PzPV5sIm
         b0AQzlWgZPfWoV9n3qx6mFl00ZhFGvXDZxqLDBD4PmN72hs2Ecru7Iyl9MAvRvmnrqBl
         uWNA==
X-Gm-Message-State: AOJu0Yzx+2vL1e99bisdRECWSiU+AQIZaaK0Y01UwZx1/1Ax/KtAHbAk
	5KmJWnkIs/xhj+JH0x7y0jiCy5150DKnMOo+aDfNhYqc+RF0rQVmWj5pWG2AZ9xIuavlvif3Fe5
	9Le2s/pfQ6Pm3a9+o3nidFBtNRqBSu3c0gQ==
X-Received: by 2002:a2e:a23a:0:b0:2c5:1bd9:f95c with SMTP id i26-20020a2ea23a000000b002c51bd9f95cmr864565ljm.53.1697706803480;
        Thu, 19 Oct 2023 02:13:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExsEqsR9QjWkmdLvjBH5U9rD81nVBlFEolTWlVrUPC4SCIyYi7zOp1jD5kLZp1vgw2LmjPnQ==
X-Received: by 2002:a2e:a23a:0:b0:2c5:1bd9:f95c with SMTP id i26-20020a2ea23a000000b002c51bd9f95cmr864551ljm.53.1697706803134;
        Thu, 19 Oct 2023 02:13:23 -0700 (PDT)
Date: Thu, 19 Oct 2023 05:13:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231019051134-mutt-send-email-mst@kernel.org>
References: <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Thu, Oct 19, 2023 at 09:01:10AM +0000, Parav Pandit wrote:
> > > 7. Additionally, a nested virtualization should be done by truly nesting the
> > device at right abstraction point of owner-member relationship.
> > > This follows two principles of (a) efficiency and (b) equivalency of what Jason
> > paper pointed.
> > > And we ask for nested VF extension we will get our guidance from PCI-SIG, of
> > why it should be done if it is matching with rest of the ecosystem components
> > that support/don’t support the nesting.
> > It they are true, shall we refactor virtio-pci common cfg functionalities to use
> > admin vq?
> For non-backward compatible SIOV device of the future, yes, virtio-pci common config (non init registers) should be moved to a vq, located on the member device directly.

I doubt it can be a vq though. This is why I'm asking for a simple way
to send admin commands to device. Then non-backward compatible SIOV can
be hopefully built on top of that.


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

