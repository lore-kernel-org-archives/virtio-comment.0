Return-Path: <virtio-comment-return-7394-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BECCA5507
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 08:28:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6F151120D5C
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 08:28:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6327398664A
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 08:28:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 59B6D986637; Wed, 13 Sep 2023 08:28:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A29F986634
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 08:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 9TYdrbHDN-mASg_7Ax_C8Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593681; x=1695198481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQqgAxUPyO+g57feyzMeKAmAJoms/DKgiw2QWgeS50M=;
        b=ZUAHFofl4tGw3Ef3R/sPnDmP8uMv3cq5v32T8hGURHhBkKVmENENtXYIWmmkqKut48
         KZiMagXRLrObDGkCDhWBZED9N29bN1MBCzYseeG/zLYzipxmpxokL0SQab1tKyOB63lM
         uSBzXYG1qGvX6jkWpdWwHMpMJWf25gjP43bZreAGXlppo6qel3KYn0aEUlMPQss7lNwU
         cdr9HRzNWeZfyn53AF3EnnvvQf1Tk6Ger++l4EDNXnSyAoFaiVGNsWA/RaeTVyrpEGz+
         Jy3Qz7jSBNXZYlRSFnb2SdnKFCl7wRBhKUJlIRwn245cPUQV4PRfLBrTCLA9fXibbq9X
         JhGw==
X-Gm-Message-State: AOJu0YxkF8Ge/bJBPkDtkH7prPzDrxjHP3ukpaDKFC6JEy7hEQ4evRUd
	rYrEeCrv2EnSiiCHcTtXzvjZPy+yhguIUceM0RYCjQDpXP2Abaf2qYrQchvZH2umoyEOxacNEP8
	Qiabdt00bB5VNsPq1OwFr29FUxy18NBGc0g==
X-Received: by 2002:a19:6707:0:b0:4fb:911b:4e19 with SMTP id b7-20020a196707000000b004fb911b4e19mr1300149lfc.35.1694593680798;
        Wed, 13 Sep 2023 01:28:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEMcfP/0ymeb7vf8h/OuUASEiCzclKteOEwG8dyfw+VidzxlOkOnklYrY5KJg88nc4YZUb7A==
X-Received: by 2002:a19:6707:0:b0:4fb:911b:4e19 with SMTP id b7-20020a196707000000b004fb911b4e19mr1300136lfc.35.1694593680402;
        Wed, 13 Sep 2023 01:28:00 -0700 (PDT)
Date: Wed, 13 Sep 2023 04:27:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
Message-ID: <20230913042534-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481ED8DC23DC6D42665FB8EDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <eb6c350e-1198-7d83-a553-99c9c8c21edc@intel.com>
 <PH0PR12MB5481760E00AD18DB8BF91636DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ad1dd3a6-7c11-5c6b-b50f-d608ec027dcd@intel.com>
 <PH0PR12MB54819C4A4220712DCD57AD56DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fff7720f-6019-bd87-b14b-c0bf996f3959@intel.com>
 <PH0PR12MB5481D11A7DF45292103D9290DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt6=AC4pYEoxNn2dpbLLEKTLj-SYV2eSUAi1ZA1LWR3qg@mail.gmail.com>
 <PH0PR12MB5481E49BFCE50AA8F8373F45DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtor0uDs9xUDXH1ZA3n9Zb9kzP9MAYwN5h6em+39gNfXg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtor0uDs9xUDXH1ZA3n9Zb9kzP9MAYwN5h6em+39gNfXg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

On Wed, Sep 13, 2023 at 12:45:21PM +0800, Jason Wang wrote:
> For example, KVM doesn't use
> hardware to log dirty pages.

It uses a mix of PML, PTE bit and EPT write protection.

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

