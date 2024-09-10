Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C821755C
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725986901; cv=none; b=VkvGf5e/06C0HdfiJCyN3qDkOcCYbyAaoabJ9wuqWr9OyvBDIHlVBOtn4d+p0FbsTBHxQxIyIcceJRgWAjQmkdpzx1qHT0H2mAJF8zMbMn8B0YYOHC6eLj6TDWyFl9WbGQG1Oz6+ZeN/VEuPPJeTJxMtg2gDpG4hbn9OGqQB9t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725986901; c=relaxed/simple;
	bh=QPL14FJcahFS5bZIf7FsHkGWBJnuUg6e5KKBqeOnjyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=g8kdYqKplXXdWTYSipeSN+qZtEfNDE/8y3JG7bWeqiYMSMAxHyMwmMjjP7oTHTyAVTukNt3NlfDr+aA0T04ScTim74bPE2H9GgukgmLXgCsz5W0H/HzEgQ4VYVIiahZqK8J8Aq1tKvBiiDySlS1bXGQL8FUWlyHaZx+8dsPxbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LjTFsJL+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LjTFsJL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725986898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8QqhFbAMfFBLkgVeufWYHAFvRz4TUjTLkf9TFAlMSgI=;
	b=LjTFsJL+5taHCtgmQhLushPhih9eLuX69BgLXfvSz52FwMzMcj7VYGGVaJ7mxypAmQ9wWE
	Uk9NdByR3/djIpQchaJssfz2dmgXDhA5FKjctNBG1OyFRLPI7jqsEi+9nNs7VlZULUDio0
	8Qrqwj4HaJHc9bm490mpW0/rZZ1WWuk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-29YLHNo2PeiPC88pl53rbg-1; Tue, 10 Sep 2024 12:48:17 -0400
X-MC-Unique: 29YLHNo2PeiPC88pl53rbg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42cb99afa97so17504045e9.2
        for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 09:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725986896; x=1726591696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QqhFbAMfFBLkgVeufWYHAFvRz4TUjTLkf9TFAlMSgI=;
        b=RI0uUmGAr54kcxQOcwB0RsNH0vSqQf0JOJ7eA20Sovva+yeNTxUMf4M1BqCnFYQhbb
         qqAoN3n5Bz0zteRAHchBDLKv77cq6KwEHkqSNYh42vcYHGYV+lqWSq68+en7htkyYCgu
         ZKn6H7Fx27JkjhqhV/I9OhBKqDkT4KP6kg6I1J0Jh/0niVuE4ZVc/hn7LyBdCdcA4OvS
         ih3ZE5gwWP3l/GzTpwxn3T2TS0YD3n1CxeS/N/QUI5qQLJmo092XgzCc6CILK0Fc3EMG
         t+863yWyFlY12CGH+NZAMAoq5AueJWZzIAMaNWXZEgm3QKYbXG5KfHgwU5FA/0kbrb+P
         h9lg==
X-Forwarded-Encrypted: i=1; AJvYcCV8eTRqw6j84/UngPAny0KlN79bihzytSUs5Be0n6H4qlsqXwOfn3W9FMmJaDrNCqMtp7qPkGvqq4FkpCPVUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8ZXk05FRPOQ48LwpRkxBMfa6qAeP/o/IX07p0qdGbv7jK+qSv
	llidA/JwsmfZBb7Yqzh2fuP6G5xBuM3m0gFyr5I2JrIQfSbKeS2mLkMJguyhRz3MQ+DjRFkqVFw
	Lni8OjpnnCkekVvlxRom/NCIr6jb5jvVXt5OHU3r3gj5vSkW41Z8BzviEzozH/G8j
X-Received: by 2002:a05:6000:781:b0:374:c56c:fbc7 with SMTP id ffacd0b85a97d-378895ca924mr10158540f8f.15.1725986896160;
        Tue, 10 Sep 2024 09:48:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLJo2PxYuIwgAjOMFhdoa6T1tZ1pTkCj39BOFUIAEPlAshjQwO3CuIx5+iwzEjA+KI4WQSWg==
X-Received: by 2002:a05:6000:781:b0:374:c56c:fbc7 with SMTP id ffacd0b85a97d-378895ca924mr10158520f8f.15.1725986895518;
        Tue, 10 Sep 2024 09:48:15 -0700 (PDT)
Received: from redhat.com ([31.187.78.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956654e8sm9413526f8f.41.2024.09.10.09.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 09:48:15 -0700 (PDT)
Date: Tue, 10 Sep 2024 12:48:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH] device-parts: editorial: Fix metadata type name
Message-ID: <20240910124712-mutt-send-email-mst@kernel.org>
References: <20240907165218.778501-1-parav@nvidia.com>
 <Zt8DqrYIXGMM399j@fedora>
 <IA0PR12MB8713207F29554B2FB2219AAFDC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB8713207F29554B2FB2219AAFDC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2024 at 04:46:34PM +0000, Parav Pandit wrote:
> 
> 
> > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > Sent: Monday, September 9, 2024 7:48 PM
> > 
> > On Sat, Sep 07, 2024 at 07:52:18PM +0300, Parav Pandit wrote:
> > > The description is for the type
> > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST;
> > > however, it referred to a non-existent definition. Correct it.
> > >
> > > Branch: virtio-1.4
> > > Fixes: aa4f6f069ab3 ("admin: Add admin commands for device parts")
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > ---
> > >  admin-cmds-device-parts.tex | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
> > > index 27d8251..3a16692 100644
> > > --- a/admin-cmds-device-parts.tex
> > > +++ b/admin-cmds-device-parts.tex
> > > @@ -152,10 +152,10 @@ \subsubsection{Device parts}\label{sec:Basic
> > > Facilities of a Virtio Device / Dev  device responds with
> > > \field{hdr_list_count.count}. The  \field{hdr_list_count.count}
> > > indicates an count of  \field{struct virtio_dev_part_hdr} metadata
> > > entries that the device can -provide when the \field{type} is set to
> > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR
> > > +provide when the \field{type} is set to
> > > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST
> > >  in a subsequent VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET
> > command.
> > >
> > > -When \field{type} is set to
> > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR,
> > > +When \field{type} is set to
> > > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST,
> > >  the device responds with \field{hdr_list}. \field{hdr_list}
> > > indicates the device parts metadata.
> > >
> > > --
> > > 2.34.1
> > >
> > >
> > In previous patches, I see the pattern `\field{type} field`. I wonder if you
> > would like to do the same here for consistency but I do not have a strong
> > opinion about this. Otherwise,
> > 
> True, maybe I can remove 'field' word from some places in general language improvement separate patch.
> Will look.


It just typesets it as italic ATM. Worth doing to avoid confusion, as some
fields are plain english words.


> > Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > 
> > Thanks, Matias.
> 
> Thanks.

