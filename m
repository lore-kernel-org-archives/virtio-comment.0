Return-Path: <virtio-comment-return-7786-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8966CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0029C749EC
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CCF2498688E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:20:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B29B198688B; Wed, 18 Oct 2023 06:20:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4D66698688C
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 06:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wb9DjrNSMIiVatQ7osKPzQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697610016; x=1698214816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIZrk0WyA9jWujZ2JE2JzGpVpKYU67mucZsGLEpHsY8=;
        b=SB+4sdoWiDExHwmczmxDRpQV+khzJ0/Rrz0BjVUDPZKXfFokArVmidIir9GcQ3RHQ+
         BJ89SsqX9yxqlvysyD3mZdh0/VyaUrkpBIKFDDUGUDdfqrF36I02VTcJSbq1tXJO2+Vz
         wb+N4sfmodlt44GhgpPwHLTcT43bdkvaAN1nN38hTNVLsccjmLkTKlSHcotpYuywWsCM
         +nxRT/MoZ5JQcsbNkrViMVQmkR8td0GLiJAkMJ9HzP3HI157zMSopkdjZcmbo+DHGTJ9
         wgTYEdujPxa8ErNbK8zHIo0/RLk7wPvfhTbrq6pAKZHbvapgq5jDCl+ehZl2AQ02pQRQ
         k++A==
X-Gm-Message-State: AOJu0YwxyqEHovJXQSw722k0UjYCrraskhxAq5iOkNFHkfRpPczcqg5U
	6PW+4wUkUzq/dOqSW+heO4cndC4HF2lQwIHn46BtjX7ukum6brK2OuvB6csQreWLQgybtcAgjzN
	tm49rA1LLSaEXuru4WM2+Cmb2GUbaH31k9A==
X-Received: by 2002:a05:600c:1c26:b0:407:5b7c:2f6a with SMTP id j38-20020a05600c1c2600b004075b7c2f6amr3247769wms.0.1697610015908;
        Tue, 17 Oct 2023 23:20:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfbC7wsToJ2n7ixJ6wXY9jqIkx0IuYpnN/YRzdNczVkn23k1BNcxkOUrRK5o7ZV4qSVP2z4A==
X-Received: by 2002:a05:600c:1c26:b0:407:5b7c:2f6a with SMTP id j38-20020a05600c1c2600b004075b7c2f6amr3247751wms.0.1697610015612;
        Tue, 17 Oct 2023 23:20:15 -0700 (PDT)
Date: Wed, 18 Oct 2023 02:20:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231018021541-mutt-send-email-mst@kernel.org>
References: <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Oct 18, 2023 at 05:02:25AM +0000, Parav Pandit wrote:
> > Please just show me your patch resolving these opens, how about start from
> > defining virito-fs device context and your management VF?
> As answered, device context infrastructure is done, per device specific device-context will be defined incrementally.
> I will not be including virtio-fs in this series. It will be done
> incrementally in future utilizing the infrastructure build in this
> series.

virtio fs has a lot of context :) I think we do need some way to
document which devices do and which don't support migration.  Maybe for
each device type where it's not defined yet, we should add text along
the lines of "Device context TBD. Devices of this type SHOULD NOT
support VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET and
VIRTIO_ADMIN_CMD_DEV_CTX_READ commands".


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

