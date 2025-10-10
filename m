Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDB6287263
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 11:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760097234; cv=none; b=LnJNseziVLyq9Nb3D5+zRLarieBS9mkPSu7U456dK+Pedzoi9bSHMZF3gEbY5VVnBrcI3MJRHYltpu8PD9lL4sVVw7TiEiGsJEA4Yvh8nwLJfVoUtirtFiKnkXph9OowRJ95G5mxr5J+iglaRyc1ipnryuljNOWiMEiAjBLnMyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760097234; c=relaxed/simple;
	bh=+sWw3FLnW0dlBTCMPwsa36QshYSRRCpZITBtdkDO4Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=V5aXpZPMfN6+NuCsSrafhRb2BtPnYg0KBj884yJXD10h+lvNuBED192n6dMd47XRHc4COm5qqeCjoV9IaXaQ9QbBlC2ROe/qlZY9i2ARh0sW0WgU2T/8cjo+NzRc0hy5IRZviTz8zRpQTAkObXmNF8LKV0z9IL8HqAQDvJ7EUrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cu+TfGj6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cu+TfGj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760097231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sYHJPRKMsJa9s9HYp+DIJl6kk7DALaxvmJxv+YG5JHs=;
	b=cu+TfGj6QDnTDri67saCLR5biVS943WkF/f4eysycjS2sJcYhLp7VE14phFf0KN0lDYasV
	oLIJI2ivIGTMf5PWv+xlqgb9S0z+9GHYzNblHqIsCxzwcP+b5R8WsqtOj0AiwJKVm0YBFW
	+e7bsNYb3D1EeHg10JgH1IMvLcI1cfY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-YNNvjQJHNey_iaN3Pa0EYQ-1; Fri, 10 Oct 2025 07:53:48 -0400
X-MC-Unique: YNNvjQJHNey_iaN3Pa0EYQ-1
X-Mimecast-MFC-AGG-ID: YNNvjQJHNey_iaN3Pa0EYQ_1760097227
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b548c516b79so194457166b.3
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 04:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760097227; x=1760702027;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sYHJPRKMsJa9s9HYp+DIJl6kk7DALaxvmJxv+YG5JHs=;
        b=pdVYrf1Suq3y0skbKJBwzl29ekH9Sj/8fM9urILo8Hu3IJgUGKJvBXAMtpotjIKpoF
         tDjUukKw2t6FX9T1X7atVf9JF7Zoiduk2bRm63ifObNh0D9Rdj+BAmV6DvxNkEXnWIyu
         KPc0kmjStQJLuQYZKyJddGjndj7fBQ4CM7zlYujlf4/vI+nY9a9bOPFdXhXhQ0RS5Qul
         daf9bsRIJXY+xGUPGl/ktROsnFBQJVGF7cz2g/E7HxXbpCRqJxr2qvxJacadVf+Ps+G8
         +/awZAWViybsz1D+J5BV0LPBBrhdxyWi+dxSOGJY/8SD3+nGZzr8fTNPsZA8QfNBYKa4
         AcUA==
X-Gm-Message-State: AOJu0Yy4TLtHAgIGT8lnUo11rBrwlig/BgrJuUGO0Akeckc2x0AZmSR7
	gDdrp/9kPuuIB59me2nlcucYoXhN8/6FoZLgWvKI1ar84W/ncDDV07h9EBZHHlQB/76xT9knUD7
	q8vUx9IoTX12K4tImGlSF1X6UYk5y3YdFk0DfkwKCBia9uwBQlJQTDmK5mGtewZd5ZpH6
X-Gm-Gg: ASbGnctzh/JTQs+yU+NFlL5y7UM8D3u1dHtWFcHZNeWn5ekQvNHSgUh1J+TumBOsgSB
	lDXT1jQhPoyDM6b1NyVPOkeNZzmo5ZtjMIvjXS2eXPB//DaLHOskSZsRC9ZZfqdKBc3x/Kfn6kr
	kVoOUl7CXKEA/qXwrSonI3zL8hagT49HVMFJbZ2w2RDgTAfdbWQ12zX/UnvcrQewt+HLInJz/G+
	0uZpHjkLAkZBSQIQRiiNhfZ0pT22qzXDNp0Sz1kNc84Pmy1bq20nP8BJQFArLjt8+az7UAc8bRB
	7cbp6QMHryeSN6HhN4umgTKYU4Ys
X-Received: by 2002:a17:907:948c:b0:b32:2b60:f0e with SMTP id a640c23a62f3a-b50aa9a055cmr1290120666b.17.1760097227008;
        Fri, 10 Oct 2025 04:53:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnZzbDoPTpL1zKFt10QXE/S7V8a3yjD3dSnBn9exSvtVx1w4I4ktITklTJ3pJp5RStnrwG0w==
X-Received: by 2002:a17:907:948c:b0:b32:2b60:f0e with SMTP id a640c23a62f3a-b50aa9a055cmr1290118866b.17.1760097226532;
        Fri, 10 Oct 2025 04:53:46 -0700 (PDT)
Received: from redhat.com ([31.187.78.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d2da2sm221011566b.33.2025.10.10.04.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:53:46 -0700 (PDT)
Date: Fri, 10 Oct 2025 07:53:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2 06/10] specvars.tex: properly wrap arguments to \urldef
Message-ID: <20251010075318-mutt-send-email-mst@kernel.org>
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
 <20251010112010.3880438-7-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251010112010.3880438-7-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: faOiP_13iqyNPDRSNNnCAhe9BxrhTgFefwIso9EKI0A_1760097227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 10, 2025 at 12:20:06PM +0100, Alex Bennée wrote:
> While the space in this case is probably harmless we should be using
> non-ambiguous argument wrappers if don't want to drown linter output
> with noise.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-ID: <20251008145916.2626143-6-alex.bennee@linaro.org>


could you be more specfic which linter complains and how?

> ---
>  specvars.tex | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/specvars.tex b/specvars.tex
> index a80557a..cf67070 100644
> --- a/specvars.tex
> +++ b/specvars.tex
> @@ -3,13 +3,13 @@
>  \newcommand{\virtiospecfile}{virtio-v\virtiorev-\virtiodraftstage\virtioworkingdraft}
>  \newcommand{\virtiourlbase}{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/\virtiodraftstage\virtioworkingdraft}
>  %Below must be used to make links work correctly in HTML
> -\urldef \virtiourllistings\url{\virtiourlbase/listings/}
> -\urldef \virtiourltex\url{\virtiourlbase/tex/}
> -\urldef \virtiourlpdf\url{\virtiourlbase/\virtiospecfile.pdf}
> -\urldef \virtiourlhtml\url{\virtiourlbase/\virtiospecfile.html}
> -\urldef \virtiourlh\url{\virtiourlbase/listings/virtio_queue.h}
> -\urldef \virtiourllatestpdf\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.pdf}
> -\urldef \virtiourllatesthtml\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.html}
> +\urldef{\virtiourllistings}\url{\virtiourlbase/listings/}
> +\urldef{\virtiourltex}\url{\virtiourlbase/tex/}
> +\urldef{\virtiourlpdf}\url{\virtiourlbase/\virtiospecfile.pdf}
> +\urldef{\virtiourlhtml}\url{\virtiourlbase/\virtiospecfile.html}
> +\urldef{\virtiourlh}\url{\virtiourlbase/listings/virtio_queue.h}
> +\urldef{\virtiourllatestpdf}\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.pdf}
> +\urldef{\virtiourllatesthtml}\url{https://docs.oasis-open.org/virtio/virtio/v\virtiorev/virtio-v\virtiorev.html}
>  \newcommand{\virtioworkproduct}{Standards Track Work Product}
>  \newcommand{\virtiooasiscopyright}{Copyright © OASIS Open 2023. All Rights Reserved.}
>  
> -- 
> 2.47.3
> 

