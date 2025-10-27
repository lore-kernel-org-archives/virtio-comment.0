Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C48A3191D4
	for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 18:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588317; cv=none; b=Qy2BVQCMHgDadnf76vgSwCj3TUmUX0wEkBxhR2BWHMR+mSO77fL5kuxO1OLqiJJBkkpRILo+DB3hIC4zz5ydfrVsT9MDcxoZ3o3GaIX1nCD8EzazymCE23Bahay4oewP/eFF5cAA9kZgOw2HrSheDa5mSl2ND5oQ9yUKNJ3qHvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588317; c=relaxed/simple;
	bh=AoIyXu6nQl1QK7G50xTCdrVAPkoWE8GMHQhCGpfP73Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=osc/Qa0zKw/U2yHsDfewu/cWVJCiqoVDdIdUq7Xbxl66YPINptbj9xFyENXPVorzBdTzBSCQ/N3HpBjUkJtORnSYi7pOPald3vRTnQEoY/VRv4dupBvmm6x3DdzMYAywRsbJb5zxv+AvRn9+wkHazq3iLTZiOY9EFH9Rulc6Vs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bL9ZsmdZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bL9ZsmdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761588313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aaFjqNiu0vL69rsQuURAGfQZl+k+Xc15ichehJHQ6T8=;
	b=bL9ZsmdZsUsPPhvZV/ChUq4CEV9+CWvgHnbXL1HuSgA1uQ1O6VNd21ZJTZFxRGmbaeKlxB
	gtTm0gG67TpIqbIWsMNlpnec20c1K5gz7GSvFmjGsfhAc/p3peWj9K1I7U9azh+cwVb02y
	0ENO+gfF71FHn3SAxeu6+7szb0MeK/A=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-cwsEc-igPkihBRcHak0mtw-1; Mon, 27 Oct 2025 14:05:12 -0400
X-MC-Unique: cwsEc-igPkihBRcHak0mtw-1
X-Mimecast-MFC-AGG-ID: cwsEc-igPkihBRcHak0mtw_1761588311
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b6d4279f147so619381866b.0
        for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 11:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588311; x=1762193111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaFjqNiu0vL69rsQuURAGfQZl+k+Xc15ichehJHQ6T8=;
        b=dYku+wveDGsQB1LOWrF4rZ0LLE0BOY6fJS7W7rdIRFVOLx7uQPiXC6nveNGYg0lU36
         bu0HSlfIrCrkMx53wWpKh217JRXdhJ3HkdVyYCeAKYEbYnFmqHzjqHDhQJKp490Zi04c
         tQVf/yf+cBJHFle2eiqgvHM+hVUUv4qbSvol2SzkMA9Xxj/OxrBOHb4DDch9RQ2sW3ij
         xESJvnD6lw9+7iBlYoEJVZ/U1jcXOonGzccaupiSM7OXsgILRRyZnulImriFa8gErJf/
         xi0cnjMuExBkL0Fpt1PifB+bVbT9wD8NyMCpk+DO6BlceUaSSEQVuUUdSy/ewk9XHeY6
         6Y0w==
X-Gm-Message-State: AOJu0YwzTtaw0yass82JAnV8H0YFY0FrTRXndu6tsMxu5M2xwtc5hjET
	rZc61fAt5SVitM4mzYxumAeTRU3o5YxV7UbD0kq8c+cLNZ/Wd2um9Kx53ElPxUd5D5463sXOTGD
	yB59Vr/PD4UuYwuW88u3Z6Ds4DPkmpdEzdCNHv9YE3h6RR95WNE9Yq5Ix0CdlPTVCFfYE
X-Gm-Gg: ASbGncsR0OS24A8eSPQXxrJqDyvMoh9u4ljnsmxtxJP8/dxY4LwSJsp4zCduEM9ML+q
	gnx1QRHBLDQ724fNyQ4qzBWdF5f/AiN2Nqz/58TaxJFDGAaLwqS8gwM3tqQlXOszc/WcYbiq9Yt
	lqWUsaHgzVX3P5T0BXIGyT69kNWDtmo2fxq2RW2Eu4oRWykudwocCvB1cz1y5EmiHhuHZZqDrnF
	+NiEtixxr+JKHlMXcNdfVc7DLJUatoc41IjPRvJ7y/73OtMx5RIkuJYZ4YQYg8KtXHEWWABDUuv
	w23p3jRR5ndyJR2mppMXBihejrVLXtbMzMaXU2xGuBAk6w8ukppGWMtaSmlcKPHG
X-Received: by 2002:a17:907:3d91:b0:b3f:f207:b754 with SMTP id a640c23a62f3a-b6dba56f8e3mr92423866b.30.1761588310770;
        Mon, 27 Oct 2025 11:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfqDaHJQFYztyW2cgiWyyi/vIvcYespz7PwQ7ZIGELaWyvXORAjThFPzVvMhuoJIuRPMvYqw==
X-Received: by 2002:a17:907:3d91:b0:b3f:f207:b754 with SMTP id a640c23a62f3a-b6dba56f8e3mr92419866b.30.1761588310303;
        Mon, 27 Oct 2025 11:05:10 -0700 (PDT)
Received: from redhat.com ([31.187.78.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077c7sm829754466b.7.2025.10.27.11.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:05:09 -0700 (PDT)
Date: Mon, 27 Oct 2025 14:05:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, mvaralar@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Message-ID: <20251027140414-mutt-send-email-mst@kernel.org>
References: <20251027174756.56284-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251027174756.56284-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bV3BC3dPqF1EVEfIVAQ5Ey0lF5FL9SQ4GVIDv4Lm-Gk_1761588311
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2025 at 07:47:52PM +0200, Parav Pandit wrote:
> Hi All,
> 
> This short series prepares the specification for release 1.4 version
> from the master branch.
> 
> note:
> makediffpdf.sh still have fails and needs resolution. WIP.

works for me. try blowing out latexdiff directory.
checkout out latest version of latexdiff might help,
too.


> Parav Pandit (4):
>   edit: remove old changelog
>   edit: add changelog for 1.4
>   edit: Remove annotation of special character
>   REVISION: update to 1.4
> 
>  REVISION      |    2 +-
>  REVISION-DATE |    2 +-
>  cl-cs05.tex   | 2120 ++++++++++++++++++++++++++++++++++++++++
>  cl-os.tex     | 2605 ++++++++++++++++++++++++-------------------------
>  4 files changed, 3407 insertions(+), 1322 deletions(-)
>  create mode 100644 cl-cs05.tex
> 
> -- 
> 2.34.1

