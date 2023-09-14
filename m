Return-Path: <virtio-comment-return-7411-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E38EE021A
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 03:11:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AC0CDC611E
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 03:11:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 97264986676
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 03:11:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8315498663F; Thu, 14 Sep 2023 03:11:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6E225986644
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Sep 2023 03:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3owkF0X7MIekY9F6WEBZYw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694661098; x=1695265898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbGhDopQ7Au3Fm217yxmsPnDaVR1FXOWj6tDRsEiGCo=;
        b=Ht2xjkR7CgmIod0mJft7x39JrXbizYPKwnRSu4qs3f17GR/go9MN7BN8RskaNeiJ33
         Lps7ANMu/jrtuEmMtbne/Pe33Hz9vMkA4qCfUz+sBV/WkxoelwUkXbFtVfzfraM1s3nJ
         uGeYlLY9OabVgyvVv9LGWOJMPH/aBBpmEatGjXZarw9kN3qldwHB7+tHRYG6aUKSADNN
         NkQXnRoQJFmfE2AhctSD1XRcc5J6zOcO4gKBz6xCvSAspE0T2KtrUy7qcG1tK/KtDLro
         w4pk7k8nJ2e2sfT3vuTO4fBSCvGEFBeAxM3VFhzWhWHq9sAfLq76kT6YrORIzgdBFsKa
         V/7w==
X-Gm-Message-State: AOJu0YxaqzTz0G+F6Z1DHkiAgxM+WQQISfHr2sMeIsNpmQKHBR7m+vur
	ml6XObFvUmBRXh/7Y85l4UVpX4obNFKlqbeqHHdBj/uk+wqtED4l4rQfInCzoSxN7mqlabVEaeg
	MJmChKM3Y6WBZMsIbp4RWDJe2jF6BflgUjQtFm8txAmPjxfuofQ==
X-Received: by 2002:a05:6512:e9a:b0:500:96dd:f95a with SMTP id bi26-20020a0565120e9a00b0050096ddf95amr243635lfb.24.1694661098041;
        Wed, 13 Sep 2023 20:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ72FpxNT016bBHAN8zv6XYQjuVP/7SdI2P2Wrw5+t1xFlCbCt7LREfDdAHwYJh08N0CvlCaGKnaIxT8qpo3w=
X-Received: by 2002:a05:6512:e9a:b0:500:96dd:f95a with SMTP id
 bi26-20020a0565120e9a00b0050096ddf95amr243626lfb.24.1694661097751; Wed, 13
 Sep 2023 20:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <PH0PR12MB5481E8114A659954251F17DCDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <17514b93-2da4-42b3-a5bf-b96358a7a875@intel.com> <PH0PR12MB5481F236858D5CD97EF55732DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9fabd346-9b6f-a727-3de8-813ec3570772@intel.com> <PH0PR12MB5481468378DC1E5491A5427CDCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2baee870-bf38-5d83-0543-1d0a68f8e651@intel.com> <PH0PR12MB5481A26B62962979C19280D2DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8bd1c228-856a-9454-752d-750997c4f4db@intel.com> <4c195683-0eb8-5e92-d97a-217cfa8af760@intel.com>
 <PH0PR12MB5481860AEAD92C74A5BC19F6DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f132cd22-e2e1-971a-894a-d62aa7ca6334@intel.com> <PH0PR12MB5481EF64F3BA3D13C34D016EDCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f34daa5-3db3-fd64-550d-86678acbfef4@intel.com> <PH0PR12MB5481BB050713B687EDD07FB2DCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9d9ac82e-8eb9-558e-916a-c327e3c3a996@intel.com> <PH0PR12MB54814FAE1D790492C8D660E9DCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54814FAE1D790492C8D660E9DCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Sep 2023 11:11:26 +0800
Message-ID: <CACGkMEvo1cc7jnPT1ia8=+eOcgHaOhr77ey4p+_qLwq+cCE2vw@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Wed, Sep 13, 2023 at 12:37=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > Sent: Wednesday, September 13, 2023 9:51 AM
>
> > we plan to implement a self-contain solution
> Make sure that works with device reset and FLR.

We don't need to do that. It's out of the spec.

> And if not, explain that it is for mediation mode related tricks.

It's not the tricks and again, it's not mediation but trap and
emulation. It's the fundamental methodology used in virtualization, so
does the virtio spec.

Thanks


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

