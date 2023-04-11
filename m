Return-Path: <virtio-comment-return-5380-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023DFC77B6F
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:10:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 511DB192319
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:10:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 464EA986549
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Apr 2023 14:10:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3D93A98636D; Tue, 11 Apr 2023 14:10:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E20A98636E
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Apr 2023 14:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: I9ohCs2tOxydwFlY9PVwDQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681222216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88xsUJ8QEz31IcXN9onNyrzzGzKRGbSzPmZvk6P4I7k=;
        b=lxFcAiTNvpjW4A+/hx4Xq09H+pWu+E4PhmB3tUZ2CcdOvRN4z89Hvag9fK/iMGqnad
         2zN0MNCHx7jrOZ77uIEHUDK8Zeb58lvdNL2gvouW9E7ohvRZJ1eXtbNBYMlEhEWHMjs8
         qvZ8UONU+1mEMJXhPrmYC8R1xrOCWlPQ2WFgQ8wROgX/IgE0tUXjCjjIURWNH4snxhkb
         3J73BmkXClZlJ94wfs35Mr0g86FnKF+Cn6WeHDzrJ4j09Qx3jF05veg+XS4IOmODVTaI
         uWoXyaeGVWE5vfGn1khcVzZJ4vZwmu9UmQxniMUeiJ8gG7Md30GqyYiEoGisK2EEm/kK
         +juA==
X-Gm-Message-State: AAQBX9cJJiDcDPKCR0bICy2am1NR6bqZo9xaMeWIl3J3Ww1uILFZyh1K
	HmiNAbsE8gDL0OUmEXlAY5sCmj4qCGGJChtAyxqKuym5YewAoo+rXajWvYZ39uK1ZwwwVoZ1x/b
	CBGTAkQL9ygAUaOzCH4Y7kTe6Rzt8SGXjkw==
X-Received: by 2002:a1c:f609:0:b0:3ed:316d:668d with SMTP id w9-20020a1cf609000000b003ed316d668dmr9709880wmc.5.1681222216035;
        Tue, 11 Apr 2023 07:10:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z9K6gcs2hA/uT2+UrzQZ3vZ0e9kFxw1p4H04dSjmgfCsw4B5qByHjhwSh1oSgk/PanZ9p6Bw==
X-Received: by 2002:a1c:f609:0:b0:3ed:316d:668d with SMTP id w9-20020a1cf609000000b003ed316d668dmr9709864wmc.5.1681222215730;
        Tue, 11 Apr 2023 07:10:15 -0700 (PDT)
Date: Tue, 11 Apr 2023 10:10:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Satananda Burla <sburla@marvell.com>
Message-ID: <20230411100914-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-9-parav@nvidia.com>
 <CACGkMEtMOy4B-O-52ka+9P3OBQ_hs1KvdjWodNYg-XKLff+giw@mail.gmail.com>
 <20230410021619-mutt-send-email-mst@kernel.org>
 <CACGkMEsZXozY7iC7L3L9FC+o8dQGY9+Hhbag2Z-G-nxr9BvDdw@mail.gmail.com>
 <20230410055947-mutt-send-email-mst@kernel.org>
 <CACGkMEsKLeJ1q3Vh8h2JYM=-RcrGd+31yR1Zsw0U=SRd1JZugg@mail.gmail.com>
 <20230411025646-mutt-send-email-mst@kernel.org>
 <c6e986e2-4806-6635-5d8b-0f70c51c6b88@nvidia.com>
 <20230411100209-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812D94E60C793734DC8DCBDC9A9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54812D94E60C793734DC8DCBDC9A9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio-dev] [PATCH 08/11] transport-pci:
 Introduce virtio extended capability

On Tue, Apr 11, 2023 at 02:07:27PM +0000, Parav Pandit wrote:
> 
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> 
> > > >
> > > > now, imagine someone building a new device. if existing drivers are
> > > > not a concern, it is possible to move capabilities all to extended
> > > > space. is that possible while keeping the bios working?
> > > >
> > > unlikely as bios is looking in the legacy section.
> > 
> > what do you mean by the legacy section?
> >
> Existing virtio PCI capabilities which are in the PCI capabilities region in first 256 bytes of the PCI config space.

well, of course, my question was for a new, future device, can
we put all capabilities in the extended space? will
we be able to teach bios to access these?

> > > New capabilities like legacy (and pasid) has no backward compat
> > > requirement from bios and drivers.
> > > so they can start from new.
> > 
> > sure.


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

