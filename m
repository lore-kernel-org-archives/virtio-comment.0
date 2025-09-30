Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620AA1DD9AD
	for <virtio-comment@lists.linux.dev>; Tue, 30 Sep 2025 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235004; cv=none; b=UqKEiAWhCOmQPDLlqTIsU2IXqcaut7iC52vR8oubA4LqSivZQx1L5Ut8p2RpF8gNRGzuzQ0sD09lZ1QVr3E5R/i1UbUNW/NwR7LGjM5u9hLLTw0hy4hkBN30VS6a6UulLu9inZgO7zTB7Sp5la6JgUr//qdCQ5WI8xuII0ZJhMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235004; c=relaxed/simple;
	bh=Wy1WHmK6Jwr2AfodIz1z9OLLrNjTHR8DPHIqHqFdy48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=sKyYXyz0fxjLifG70YnqTkgePFYWMkbIRzkGTAcHppJtOmp7o2APbKk8Ip9KeuPITTEUhm+83KpLk2rCrVqlaGY+X6Aq8fiTu7tPOCvi/AGGZvhv39S7VYaiHxt3f4zmgrnhelHOZzohegQWZzsVxV5Iv0Xl2ypIirxmYgxaUYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fjTMkHfs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fjTMkHfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759235000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhBNUKcHULG6hOH1wrVa9zj1PAsDc5Bk5UKZQbw+6fc=;
	b=fjTMkHfsTnwOlkt/AJfaeXGkWQz/bec8gNRRpX67Y24Ab30R3yYYh3Btlq105JAnPcTlkY
	GRjT8I5C1YqcA43xEgN69T1nOc6cui71sLdXbQFazFN+OyEwotDj8iplmDRFBW7LKYmRkV
	BI+dkK8NQElo60m1os04hOHmFJUnENU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-8tryO9jLOFuRkaDKkrTKgw-1; Tue, 30 Sep 2025 08:23:18 -0400
X-MC-Unique: 8tryO9jLOFuRkaDKkrTKgw-1
X-Mimecast-MFC-AGG-ID: 8tryO9jLOFuRkaDKkrTKgw_1759234998
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ece14b9231so4050626f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 30 Sep 2025 05:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759234997; x=1759839797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhBNUKcHULG6hOH1wrVa9zj1PAsDc5Bk5UKZQbw+6fc=;
        b=pRU6dw4Nuwv+92wYsWC9Lxn6nP7xEBzEk++NLu5r1SsaCQX19vBnDhPzL4iN+JM7uo
         kGArcd2Pj4yvZVh3aAbDTsnhfwv1F/2UYHTjePJ137RfszDcP3K4lq+hmjDhalaG23yR
         Re/Pb9F6W3F0VNzVfjLBog5RHFEfJ139I4llZq3GtD2VZSnLBfsiu5qwNG988qc2By9A
         18bYIqUOxdvY/+v+9QLTBG/66xy1lkt5cTFZtLo4oJ0hVw7+EpOs+WUjrfhIyYCN48M1
         Z99ROE3ds+B/GRqLjY4nlkA2i+Y8CzlMfI2DuFOxlob2yNBR7PC1WdJo/MpZqIiDIogh
         P+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6lWGQ1fVqZNqC48IAQ1HJRRasSKTzUfLrVyV6qvK0D4lA0ey6IY3ueX3duTA54NXUMPm/YfT2UT8rx9BNhA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg+ppeRpapXLmygy4Zo00XvzWyKbk6BkueO9Zg0lUYOsZ0Vlvh
	nFrn8rXQljxDXorNgLbhJnr30hPGHMOO6TeLSu3Kr7BWteHaZxrcyUr3oVILop32rW4SxrRqVg+
	JtfsIId70oxtJ752ffvRliG119E63d63+g5mMPIK6w2rrRnuBfpVIRuWjo3hwzraxJ+A9
X-Gm-Gg: ASbGncs25Si/3HqVdHoLB4rV4S5IF92gKfcNpGAzDkpH13pOxThONVi8HYsul1ZfKoE
	M0jYqeUNhouA8IJTVKMPo4+/oxKU7LF468Sg4sOV+71MvsgktMZJGAzOHv1T4uTLn/WyH0yafTJ
	qdD0QxNes0MRv8XQDDOnGhpR1ZS6lhOjbMIjlF9/pXxBCl+rDQvbfHICZ+srE5IlzizmPDtqVmz
	B2uPoHrWHaJdmSv1ukd+LyDrjPbW1/0Y8zJddcnOGezOC7ujiD2NDO/COi0oZTj8AaEnzo1oEXY
	KfPH5kVcc1CVoj1296gW+JuIC/VeoGmb/t+z4OQ=
X-Received: by 2002:a05:6000:2601:b0:3ee:14db:700d with SMTP id ffacd0b85a97d-40e498b7710mr19581754f8f.11.1759234997484;
        Tue, 30 Sep 2025 05:23:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH26Vofqyo8+te3rGBxvz3nDTPQQ5jQKPh5r6Wm1DRjjm6s3R79YIH/+qJZfCiWKFcGNo++MQ==
X-Received: by 2002:a05:6000:2601:b0:3ee:14db:700d with SMTP id ffacd0b85a97d-40e498b7710mr19581733f8f.11.1759234997035;
        Tue, 30 Sep 2025 05:23:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1518:6900:b69a:73e1:9698:9cd3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb7203b8asm22774397f8f.9.2025.09.30.05.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:23:16 -0700 (PDT)
Date: Tue, 30 Sep 2025 08:23:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Cornelia Huck <cornelia.huck@redhat.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: Re: Use of LaTeX for the specification
Message-ID: <20250930082057-mutt-send-email-mst@kernel.org>
References: <87ms6dl3sh.fsf@draig.linaro.org>
 <CY8PR12MB719523C466209B552DE30000DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87o6qtjeyr.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87o6qtjeyr.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XBbaexATHLSudoy8vLFEoT8cSD2QlNK5lO67ZamQfKI_1759234998
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Sep 29, 2025 at 07:22:52PM +0100, Alex Bennée wrote:
> Parav Pandit <parav@nvidia.com> writes:
> 
> >> From: Alex Bennée <alex.bennee@linaro.org>
> >> Sent: 29 September 2025 08:11 PM
> >> 
> >> 
> >> Hi,
> >> 
> >> I recently updated my distro to Trixie and found that HTML generation is
> >> broken. 


Alex pls note HTML generation is using htlatex not xetex


> > I test html and pdf generation regularly on merging patches.
> > And it seems to work for me with below version.
> > Which one are you using that fails?
> >
> > XeTeX 3.141592653-2.6-0.999993 (TeX Live 2022/dev/Debian)
> > kpathsea version 6.3.4/dev
> > Copyright 2021 SIL International, Jonathan Kew and Khaled Hosny.
> > There is NO warranty.  Redistribution of this software is
> > covered by the terms of both the XeTeX copyright and
> > the Lesser GNU General Public License.
> > For more information about these matters, see the file
> > named COPYING and the XeTeX source.
> > Primary author of XeTeX: Jonathan Kew.
> > Compiled with ICU version 70.1; using 70.1
> > Compiled with zlib version 1.2.11; using 1.2.11
> > Compiled with FreeType2 version 2.11.1; using 2.11.1
> > Compiled with Graphite2 version 1.3.14; using 1.3.14
> > Compiled with HarfBuzz version 2.7.4; using 2.7.4
> > Compiled with libpng version 1.6.37; using 1.6.37
> > Compiled with pplib version v2.05 less toxic i hope
> > Compiled with fontconfig version 2.13.1; using 2.13.1
> 
> ➜  xetex --version
> XeTeX 3.141592653-2.6-0.999996 (TeX Live 2025/dev/Debian)
> kpathsea version 6.4.0/dev
> Copyright 2024 SIL International, Jonathan Kew and Khaled Hosny.
> There is NO warranty.  Redistribution of this software is
> covered by the terms of both the XeTeX copyright and
> the Lesser GNU General Public License.
> For more information about these matters, see the file
> named COPYING and the XeTeX source.
> Primary author of XeTeX: Jonathan Kew.
> Compiled with ICU version 76.1; using 76.1
> Compiled with zlib version 1.3.1; using 1.3.1
> Compiled with FreeType2 version 2.13.3; using 2.13.3
> Compiled with Graphite2 version 1.3.14; using 1.3.14
> Compiled with HarfBuzz version 10.2.0; using 10.2.0
> Compiled with libpng version 1.6.47; using 1.6.48
> Compiled with pplib version v2.2
> Compiled with fontconfig version 2.15.0; using 2.15.0
> 
> It also fails run with the texlive distro:
> 
> 📦[alex@texlive virtio-spec.git]> xetex --version
> XeTeX 3.141592653-2.6-0.999997 (TeX Live 2025)
> kpathsea version 6.4.1
> Copyright 2025 SIL International, Jonathan Kew and Khaled Hosny.
> There is NO warranty.  Redistribution of this software is
> covered by the terms of both the XeTeX copyright and
> the Lesser GNU General Public License.
> For more information about these matters, see the file
> named COPYING and the XeTeX source.
> Primary author of XeTeX: Jonathan Kew.
> Compiled with ICU version 76.1; using 76.1
> Compiled with zlib version 1.3.1; using 1.3.1
> Compiled with FreeType2 version 2.13.3; using 2.13.3
> Compiled with Graphite2 version 1.3.14; using 1.3.14
> Compiled with HarfBuzz version 10.2.0; using 10.2.0
> Compiled with libpng version 1.6.46; using 1.6.46
> Compiled with pplib version v2.2
> Compiled with fontconfig version 2.13.1; using 2.15.0
> 
> >
> >
> >> As far as I can tell this comes down to the use of \cline as shown in this
> >> minimal example:
> >> 
> >>   \documentclass{article}
> >>   \usepackage{hhline}
> >>   \begin{document}
> >>   \begin{tabular}{ |l||l|l| }
> >>   \hline
> >>   Bits & Device Specific & Purpose \\
> >>   \cline{1-2}
> >>   Read / Write & Device Specific & \\
> >>   \cline{1-2}
> >>   Purpose & Device Specific & \\
> >>   \hline
> >>   \end{tabular}
> >>   \end{document}
> >> 
> >> which results in TeX ending early:
> >> 
> >>   ! Undefined control sequence.
> >>   \f:HBorder ...border-top:1px solid \#\hline:color
> >>                                                     ;"></td>
> >>   l.8 R
> >>        ead / Write & Device Specific & \\
> >>   ?
> >>   ! Emergency stop.


What is the command line you are using for this example?

> >> I'm liaising with Debian and the TexLive authors to try and figure out whats
> >> going on. However it does raise a bigger question for the specification - why do
> >> we use LaTeX?
> >> 
> >> I don't doubt that is a powerful typesetting system but its arcane syntax is a
> >> bit of a barrier to entry especially for casual contributors. With the recent
> >> breakage I wonder if I'm the canary in the coal mine and this will potentially be
> >> a problem for everyone else once their TeX setups upgrade.
> >> 
> >> I'd like to augment the repo with some GitHub actions so we can keep an upto
> >> date rendered draft available as well as some lint checks so we can avoid
> >> introducing dodgy markup. But firstly I want to ask is LaTeX the right source
> >> format for the spec going forward? Is this something mandated by OASIS or
> >> just an accident of history?
> >> 
> >> Thanks,
> >> 
> >> --
> >> Alex Bennée
> >> Virtualisation Tech Lead @ Linaro
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro

