Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411D5155CAC
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698679; cv=none; b=NyVcDmQfhGyXsxtFVtHGavJIx2VmAyXny1ZIwe0zSvHfFTy9rM3agrfsVLVGlLkkfhc4JOL+Ya8+DPQofjBcFQ6ghx9RECVTurepEYZ/OqtO5Wfl1NYWSYzws+zxM+iiSrG1Yt82By7T74xiQHOvPtNC8dfJnNeqyey4H/bl09o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698679; c=relaxed/simple;
	bh=N7d2Yyeqzqt2DZgBmJuTA/Z/E/ss7VvBEc7SHjCANSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oTXG7tjUM+O5lkFKz82ruCmLPc+QOwNK09PiOmRiLRw4SIYYUa/YJbq5z53dIw5isUx4QVvh1A5STcVEiquDULKVSERigdxtzfqgrEhp2kkxX4GzmcYUmTWllfcN8JDaKDcrLNxXe1fEaUNpAiZmEEd/CSpxjMzS3+3V2bFpcEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qaka8Fk/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qaka8Fk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720698676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAZAthZJcXOzevnX5edDY9tob3P4p/S2wVWI0QPATBw=;
	b=Qaka8Fk/+NnNtDXpOVqzyCTeb2zyzMED5zeQPMDa4nXgQC370J5p9GhB0VLyqvq2zQTwJq
	UvzoLPGus6m6fCnBUwYTcXPvWbxcUIgaija6kryLTDSmFsmhz3zwwKaQBrs7lZiaXBCaFK
	gSUuhBW4p2ak4itYqwlWstC4fZuJWZw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-fRD5MkIBNJ6bSESAWRsUhA-1; Thu, 11 Jul 2024 07:51:14 -0400
X-MC-Unique: fRD5MkIBNJ6bSESAWRsUhA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-58d6fdee657so841319a12.2
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 04:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698673; x=1721303473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAZAthZJcXOzevnX5edDY9tob3P4p/S2wVWI0QPATBw=;
        b=q9a8wCdGC1ATOZ2Uh6m4rHTWL5to/zmmx2rvnKFmII01QeKM1Dsssu8RjI/3oC+PrC
         vtiYJvPLdj4UL8DXplBOfyw2q/KjlEIYsO2cLUT6Chr2Icy0ehlMQiFRHTd45WQWlKb3
         XopytsGlML5evktdBq3ecMVtI5UtgeS3EgUYG6j2PGDCWvwOOs4YfEUcD9JLBX8zAneb
         vYsaLpNGrf1qzSZOO67/scIu2+WUUrlTy40AJMDCI4MTs1K6vEZ/adwgS+V4qEGDAvJG
         MSBXkA5Gnn4y2+oVltrm5THy9M4TgdfYriNuuTvq5hXoK5mwHrd2rnZHbeGJyRzRiVvm
         F8hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjccfbRVxZjjUvIpT5Iqz0pTKsK+aihe4g+k18Aoft9qPXz1AaxltwxYufTZEPbFFfpWz0spleCARmV167PPvtLrvz6lyLp4JDE6UEfzg=
X-Gm-Message-State: AOJu0YwvKoq2WMz/ZksqAxRumn/RgbIVO/qaulENefzys6xdJaQbqhDr
	ri/m+pJw/ZjRbeprnAG9ORMSBFEYMTeeOtHkb3+kmNbgiXP28LfX8+zyMuagjpWKeYewQWF/5Tn
	bz2vIKUcr7JvThJcSHbT6Zr3FfWRITV3JspHJD+nNqgDPv52X3ZbeIuy087V5W3uv
X-Received: by 2002:a05:6402:2707:b0:57c:6234:e95b with SMTP id 4fb4d7f45d1cf-594ba98fafdmr6573457a12.5.1720698673534;
        Thu, 11 Jul 2024 04:51:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2ypzZmlFEdFqGKfh4PpCcTVwBs9kW4oO5ojl8zx5MKkPxQ/ys/9qzsnBZCDlmq+qurPWXcg==
X-Received: by 2002:a05:6402:2707:b0:57c:6234:e95b with SMTP id 4fb4d7f45d1cf-594ba98fafdmr6573434a12.5.1720698673045;
        Thu, 11 Jul 2024 04:51:13 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bbe2d16csm3374362a12.36.2024.07.11.04.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:51:12 -0700 (PDT)
Date: Thu, 11 Jul 2024 07:51:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240711074942-mutt-send-email-mst@kernel.org>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <20240711070740-mutt-send-email-mst@kernel.org>
 <87zfqob184.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87zfqob184.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 11, 2024 at 01:46:19PM +0200, Cornelia Huck wrote:
> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Jul 11, 2024 at 01:18:18PM +0530, Viresh Kumar wrote:
> >> The virtio documentation currently doesn't define any generic
> >> requirements that are applicable to all transports. They can be useful
> >> while adding support for a new transport.
> >> 
> >> This commit tries to define the same under a new Appendix section.
> >> 
> >> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> >> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >> ---
> >
> > I am not sure what is this supposed doing - just listing basic things
> > transport does or all things it can do?
> >
> > If the later, this ignores several things that transports can do,
> > such as shared memory, data in notification, etc.
> 
> Maybe split this up?
> 
> A transport needs to implement the following:
> <list of mandatory things>
> 
> A transport is encouraged to implement the following:
> <list of non-mandatory, but strongly suggested things>

Some things just depend on feature bits, and a transport
can make a feature bit mandatory if it wants to.

-- 
MST

