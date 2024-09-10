Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D235225A8
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725999680; cv=none; b=eVQvafN+eWfXiDCLJHyRPFqWUVS6xjP08LTBw+h5J4nKFkfpyoTl6DMaYSSvnKxYetwE40VPezG1tPPwWLhQroJM/18iKWyQCLWR2RADUzEQcDZH5ZeAP8B1klWBiBZR7qxqZ+tagElb82D9pimmmApnrAXYeOXkgxNI82a7etc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725999680; c=relaxed/simple;
	bh=9cF1vM/ZEWMvyrX58SI+XSrgMKxxQ2yReMOtTcv5st8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=o7jinM+ziE0SzFaDXWKVTbSj5xPgmPAIFUjkhv5z4NWj0C7kjMGlmolPgdEownenPPPfYBeUIzmUgEQvQYo+nfCAYan73o1xc3AamYGIaPzWpXsYX8Ms21h1UQmjIJVYvwUMfCmzwfYbB/XlbXnLuEQpKt9lAmeGd+jLgctv7xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJOhXnrH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJOhXnrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725999677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JxQiFuiZoEPFqBtvGCXnnKDTsZMHr0v8XUPNDfP6svY=;
	b=VJOhXnrHuo+LCgQUkoiuBCUP1aTgKGyxJpkXDXVc0Ln3BdpGZXpBGbhfeCfmM9fYX46m7f
	v1+ld3ZC+L4NGL1yzWn+9uZjO+si+ZuyyyoX9s2Uccf/Yiwpqeeu1l55ZP22swNBs81fyF
	Cyo7digte4mYm8rnc6xbSBn7apOTsyo=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-ZiVoPsWdOyqS5_wGOFqxNQ-1; Tue, 10 Sep 2024 16:21:14 -0400
X-MC-Unique: ZiVoPsWdOyqS5_wGOFqxNQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2f760dce28bso23881211fa.2
        for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 13:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725999673; x=1726604473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxQiFuiZoEPFqBtvGCXnnKDTsZMHr0v8XUPNDfP6svY=;
        b=DnKy0qQ1Mgt1/M5XTOOhlolF8Z61LVnKaNVhPHdy0RPNC3qyyNl++dLQVsR++ozsK4
         LcvrDDnx5+5YsmQS+qNq0zCrSOpG8zKajUjvB/mXmvOu6IphbmduvAJUtUXoJrIyMZKt
         AVVCVU9d3384t+D+ibxvxprweMnj2+J2xDL8zmgEPrrjNxpsi5s71Bt5sy4tVM3eBD1Z
         lPZQn13PYeXP6OyzwaAAGjGlLAz5xtBGHDN+Z3mfWvnMgg1ogkQgi6Wdf3Rg3zbbLFhf
         0XFa24xaLN0LMyLOiTuVmtdJ5KUvNrQXfgXELtiq5xYPXrSJ1HMaY3h72kbt4qS8OG/t
         aTKw==
X-Forwarded-Encrypted: i=1; AJvYcCWURlJt6aTLkr9xW6qUmlVuuXKw2gyAxWNRvyGcvslMS4Ir1ZhY/RWf8+aD++3nzRY8UI7v7ozHDvjHlvdMxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzY1JO5aV31yxElpMU6lCuJC0FnuwgxHY53P6L6DqCPWKgv7tVx
	dNR6wSZmLWG3ngvIiKPB9uaiyPwgxvGGiNBcl/nG87WDkpZkR5Bb0H4A1NwjzWA6vENhqV4/vMj
	8ITHQe8BTM3siRykvR58emnkCApdCyb75DiomFFNbT0RrFu4m1InKoU9Q3pP1JRld
X-Received: by 2002:a2e:880f:0:b0:2f6:4f17:aec9 with SMTP id 38308e7fff4ca-2f751ee400cmr89307161fa.16.1725999672562;
        Tue, 10 Sep 2024 13:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgc6FGCciOT8W4H5dLz46sBFutvqUri24VXijunli0OSJPfq2lpTAQASNcHBuibG2MnAxWpQ==
X-Received: by 2002:a2e:880f:0:b0:2f6:4f17:aec9 with SMTP id 38308e7fff4ca-2f751ee400cmr89306931fa.16.1725999671541;
        Tue, 10 Sep 2024 13:21:11 -0700 (PDT)
Received: from redhat.com ([2a02:14f:176:f5ce:2d9:5bfa:9916:aa0a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd52135sm4617926a12.49.2024.09.10.13.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 13:21:09 -0700 (PDT)
Date: Tue, 10 Sep 2024 16:21:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH] device-parts: editorial: Fix metadata type name
Message-ID: <20240910161943-mutt-send-email-mst@kernel.org>
References: <20240907165218.778501-1-parav@nvidia.com>
 <Zt8DqrYIXGMM399j@fedora>
 <IA0PR12MB8713207F29554B2FB2219AAFDC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910124712-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713C76D953BE65BE6842ACADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910143400-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713D2C68564AB88E9D159B8DC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB8713D2C68564AB88E9D159B8DC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2024 at 06:54:38PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, September 11, 2024 12:05 AM
> > 
> > On Tue, Sep 10, 2024 at 04:51:03PM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Tuesday, September 10, 2024 10:18 PM
> > > >
> > > > On Tue, Sep 10, 2024 at 04:46:34PM +0000, Parav Pandit wrote:
> > > > >
> > > > >
> > > > > > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > > > > Sent: Monday, September 9, 2024 7:48 PM
> > > > > >
> > > > > > On Sat, Sep 07, 2024 at 07:52:18PM +0300, Parav Pandit wrote:
> > > > > > > The description is for the type
> > > > > > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST;
> > > > > > > however, it referred to a non-existent definition. Correct it.
> > > > > > >
> > > > > > > Branch: virtio-1.4
> > > > > > > Fixes: aa4f6f069ab3 ("admin: Add admin commands for device
> > > > > > > parts")
> > > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > > > ---
> > > > > > >  admin-cmds-device-parts.tex | 4 ++--
> > > > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/admin-cmds-device-parts.tex
> > > > > > > b/admin-cmds-device-parts.tex index 27d8251..3a16692 100644
> > > > > > > --- a/admin-cmds-device-parts.tex
> > > > > > > +++ b/admin-cmds-device-parts.tex
> > > > > > > @@ -152,10 +152,10 @@ \subsubsection{Device
> > > > > > > parts}\label{sec:Basic Facilities of a Virtio Device / Dev
> > > > > > > device responds with \field{hdr_list_count.count}. The
> > > > > > > \field{hdr_list_count.count} indicates an count of
> > > > > > > \field{struct virtio_dev_part_hdr} metadata entries that the
> > > > > > > device can -provide when the \field{type} is set to
> > > > > > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR
> > > > > > > +provide when the \field{type} is set to
> > > > > > > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST
> > > > > > >  in a subsequent VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET
> > > > > > command.
> > > > > > >
> > > > > > > -When \field{type} is set to
> > > > > > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR,
> > > > > > > +When \field{type} is set to
> > > > > > > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST,
> > > > > > >  the device responds with \field{hdr_list}. \field{hdr_list}
> > > > > > > indicates the device parts metadata.
> > > > > > >
> > > > > > > --
> > > > > > > 2.34.1
> > > > > > >
> > > > > > >
> > > > > > In previous patches, I see the pattern `\field{type} field`. I
> > > > > > wonder if you would like to do the same here for consistency but
> > > > > > I do not have a strong opinion about this. Otherwise,
> > > > > >
> > > > > True, maybe I can remove 'field' word from some places in general
> > > > language improvement separate patch.
> > > > > Will look.
> > > >
> > > >
> > > > It just typesets it as italic ATM. Worth doing to avoid confusion,
> > > > as some fields are plain english words.
> > > >
> > > Do you mean to add word 'field' wherever missing as Matias suggested?
> > 
> > 
> > If it's a field in a struct, it should be in italics, yes. 
> It is already in italics.
> 
> The question was : should be written as,
> 
> Option_A: \field{type} field indicates so-n-so...
> or
> Option_B: \field{type} indicates so-n-soo..

Ah.

I don't really feel adding "field" adds much, because of
italics and because one can see it's a field from the name.
So, brevity wins.


> > I didn't get which field
> > Matias refers to, exactly.
> > 
> > > If so, no strong opinion to me, I will run a separate patch for such
> > improvements without fixes tag.
> > >
> > > >
> > > > > > Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > > > >
> > > > > > Thanks, Matias.
> > > > >
> > > > > Thanks.

