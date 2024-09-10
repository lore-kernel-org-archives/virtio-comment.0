Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DED417A584
	for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 18:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725993309; cv=none; b=iYzsabWWLS5iGj81lVf5C0WTfH+gJbSUNuvykEtkN2KiC+7xE+ncD3H7awSQqqvAd0S73SNgqk4VlXu1pB9HF4W9FjKzhfCO8zelZWCbAVgIkV2NLyAFqsAGWAgB2zxn6cEsxoV/ETQPyCaPwM458PpokEaNaf+dF6mmlB9mOAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725993309; c=relaxed/simple;
	bh=VzxNXa/5dpCwk9ihA7URgs1wAHWlrT/fK6jaY/Ezjwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pkQwPqty16qaQl54BZxND3UEqUzJ7jDRDXmmM5Tw/WcM7uwWY0AMOf/Qfr+vdcf7HzCzJsxhoNmZqmPuRmYfgiB3hidwV4T/Zr6Og+H/QGEeiv2oyM34BvwQ6dcMB5M00+A+e1JjUxoBiOeCg/fMwl2AAPNHtgjb6GSQQOgJZKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PUxQPz0R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PUxQPz0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725993306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VDyfunKuuYXElmxQFAQqtX3VR3Bq3ysStT+jZOXdDl8=;
	b=PUxQPz0RSwKeC9P+Nnvjyx52CDKEqMBoPV12T/bGaN8eNI84cC9SKsMR1dSPTiREPar8oR
	thHRgNnVHdyJ1tXRQSMAtGV06gQig/Ys40PyB2WnacfXw731UXY0WV417Mg/vaVB5dDr84
	qq0tmk7UP7pPQOfWkCTpfi7OFuLL+OU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-1YZYz0JxOIqtRQL85NpJfA-1; Tue, 10 Sep 2024 14:35:05 -0400
X-MC-Unique: 1YZYz0JxOIqtRQL85NpJfA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42cb6f3c476so9262405e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 10 Sep 2024 11:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725993304; x=1726598104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDyfunKuuYXElmxQFAQqtX3VR3Bq3ysStT+jZOXdDl8=;
        b=KLF4eVWPKKr1EfiW/T2racbKuBN4t4WKnQu5i50yFhvHuH6FlJ7yF0gZxaApo0dfuB
         hMG9Tq3LHDCFx+GpZdKFF3bZ4nha3GMXu1ArlzSmYgnMKOOoR6zhxAn3kPeCQBa5z8KW
         VT3Rkzy+8iy0kmRiUzy3cBxezPb3O2B9NLgF6jTU2nPgGzI19p7YqsY6Fs3tJWI6HI/Q
         o0IXfbK6HnxauOQT7aJQMn8AUv7pSaNxt/dkTA6SHgVwreHm2yO/BkOequdAVRskjawa
         D4xtmspKE9sakY1l5/OBXRfX+EegGWnk8gndtIODNxEWniQ97e858nJEMxxuhpSpOFiG
         0aHA==
X-Forwarded-Encrypted: i=1; AJvYcCVPJtmYYYorvYRrQnbSnWhD6RDERCcQuTF+qFkRTs0Q2hK/zlMDHi+sQBZIBLxdW9cYXwDsj13/j/OgZHBOAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZviepNjNwHVoFyUDaA+m8cGi7ySr+Ca9lZIUHiDQry/RFaWI0
	QrB+5DDHnOCjWVGHFwbgn+B+buFzQjCPOJEhdzyPjkdZVkqeHQong2zKVcvS+F9GooVO4ge9SHa
	gu9djOBF/bYPdlz4NCYe48N1xhy1s0NqihnFnocklDkmW7lqMiZ31c14au7p30Stu
X-Received: by 2002:a05:600c:1c29:b0:42c:bd27:4be4 with SMTP id 5b1f17b1804b1-42ccd32405bmr4173865e9.8.1725993304070;
        Tue, 10 Sep 2024 11:35:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4FpLlNWSDgNEaX+7iJTJdEAVqG1WSpnd/2kTaC05e3fBE4Slx6uoHew/UTPzHGgmgnaC6Og==
X-Received: by 2002:a05:600c:1c29:b0:42c:bd27:4be4 with SMTP id 5b1f17b1804b1-42ccd32405bmr4173665e9.8.1725993303329;
        Tue, 10 Sep 2024 11:35:03 -0700 (PDT)
Received: from redhat.com ([31.187.78.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cbfd6a360sm33276155e9.7.2024.09.10.11.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 11:35:02 -0700 (PDT)
Date: Tue, 10 Sep 2024 14:34:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH] device-parts: editorial: Fix metadata type name
Message-ID: <20240910143400-mutt-send-email-mst@kernel.org>
References: <20240907165218.778501-1-parav@nvidia.com>
 <Zt8DqrYIXGMM399j@fedora>
 <IA0PR12MB8713207F29554B2FB2219AAFDC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910124712-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713C76D953BE65BE6842ACADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB8713C76D953BE65BE6842ACADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 10, 2024 at 04:51:03PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, September 10, 2024 10:18 PM
> > 
> > On Tue, Sep 10, 2024 at 04:46:34PM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > > Sent: Monday, September 9, 2024 7:48 PM
> > > >
> > > > On Sat, Sep 07, 2024 at 07:52:18PM +0300, Parav Pandit wrote:
> > > > > The description is for the type
> > > > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST;
> > > > > however, it referred to a non-existent definition. Correct it.
> > > > >
> > > > > Branch: virtio-1.4
> > > > > Fixes: aa4f6f069ab3 ("admin: Add admin commands for device parts")
> > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > ---
> > > > >  admin-cmds-device-parts.tex | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/admin-cmds-device-parts.tex
> > > > > b/admin-cmds-device-parts.tex index 27d8251..3a16692 100644
> > > > > --- a/admin-cmds-device-parts.tex
> > > > > +++ b/admin-cmds-device-parts.tex
> > > > > @@ -152,10 +152,10 @@ \subsubsection{Device parts}\label{sec:Basic
> > > > > Facilities of a Virtio Device / Dev  device responds with
> > > > > \field{hdr_list_count.count}. The  \field{hdr_list_count.count}
> > > > > indicates an count of  \field{struct virtio_dev_part_hdr} metadata
> > > > > entries that the device can -provide when the \field{type} is set
> > > > > to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR
> > > > > +provide when the \field{type} is set to
> > > > > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST
> > > > >  in a subsequent VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET
> > > > command.
> > > > >
> > > > > -When \field{type} is set to
> > > > > VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR,
> > > > > +When \field{type} is set to
> > > > > +VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST,
> > > > >  the device responds with \field{hdr_list}. \field{hdr_list}
> > > > > indicates the device parts metadata.
> > > > >
> > > > > --
> > > > > 2.34.1
> > > > >
> > > > >
> > > > In previous patches, I see the pattern `\field{type} field`. I
> > > > wonder if you would like to do the same here for consistency but I
> > > > do not have a strong opinion about this. Otherwise,
> > > >
> > > True, maybe I can remove 'field' word from some places in general
> > language improvement separate patch.
> > > Will look.
> > 
> > 
> > It just typesets it as italic ATM. Worth doing to avoid confusion, as some
> > fields are plain english words.
> > 
> Do you mean to add word 'field' wherever missing as Matias suggested?


If it's a field in a struct, it should be in italics, yes. I didn't get which field
Matias refers to, exactly.

> If so, no strong opinion to me, I will run a separate patch for such improvements without fixes tag.
> 
> > 
> > > > Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > >
> > > > Thanks, Matias.
> > >
> > > Thanks.

