Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6311B21340
	for <virtio-comment@lists.linux.dev>; Sun, 15 Sep 2024 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726401390; cv=none; b=GsKbzXptyie555rYM18Ol4lV4UA1hyCNAulnA6Agzjg8+nDLM8c0mXSqYsjwWgcKALS3WK57qght9AUVQKULrU89i6ZHehbzTgbim3JXleEFxFk1g6NFyJSHEd3muUoKtCAxzP3i1sZs1kNs8tJACknaXo2UqCqiQ1b7GP17Xss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726401390; c=relaxed/simple;
	bh=k4l+PpmQZmmif8pOfO2i/m1eMC9tlHxpJOJ+nGKIxoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RLJjPS0hNOC1OVe7ux0uUsLyCYJj6CkH41UmYFyWe2sdndcqD40Osnsw2Mh1fYZxKfA3rU53jFctrSEjokHiNfsvypBbzMuR/3I96evWR6E6M96MBPXmuefKOMOI/4/Rz8zOjXmAHJ+MJUrg68XreXkgAP+2wagGWD9pCS/Cbss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cHqTnQT+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cHqTnQT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726401387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYE8daoPMeIxe+llQlemg18D1Ls7/9delomTAmJ6QeE=;
	b=cHqTnQT+l96L9Fj430J1meKKcrIS8uYK/cPp2SzH1Ah5ReHwnBYmS27LKJu5o13O26ECcU
	A1LGlhzV02elxooEilKf4AhHdc5h9kAbNAB+ffrWbYmUwpbU4oQYyD+09r0L7Ifr8csGdm
	05F8UBuuB+mNaNIeGvVr+Y2eLGGgt08=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-4jYXDO-6M8mK24ryPDLEWQ-1; Sun, 15 Sep 2024 07:56:25 -0400
X-MC-Unique: 4jYXDO-6M8mK24ryPDLEWQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-374b385b146so1821019f8f.0
        for <virtio-comment@lists.linux.dev>; Sun, 15 Sep 2024 04:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726401384; x=1727006184;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYE8daoPMeIxe+llQlemg18D1Ls7/9delomTAmJ6QeE=;
        b=oO0vL7LKwvi4o1wWmaFQT5QTg6Y2ebO7ibSmF9zvZgGEq5/sAexhwoTEX6V7DR7Bik
         wUUHqltWzG2hL9DIPtMNzwDS3rFq8hab2yUk7Id9S8So2PetDaO062Vf3cSnOEjRLHgC
         mXAstDzHbX35dBA9Je6grrdW+L/QIc6CUCHKAp5jOIAnrTYQtqiOXyJuHfulAV7R3gEl
         K3GJe8YhEFHEAcqMCCOd8Fh5i+EgSPthBWC2qWv+pRObdQijnsR8lUHbNcxDh3oeiGPL
         m2n0n5BHfpuqXUMEn3UfYowi9somkVuX/qvXAszfp/poaeiEx56upJaqUicmk85Pi9fj
         AaeQ==
X-Gm-Message-State: AOJu0YxdeTgnJ+7b/tAiRm0HHr6TQCPHApHfSRPy3nr+BKRY63ynkkZ+
	VSayXXCK40N6sfURdu/uQEx0saN1eWi1QMM5ZKZwUpUcYphPL9mwgopipxDCeH331DM4dxNjuox
	v+15qBqPHokgNx5WrW400MA9hysNuSc419O6ykeV3GWCSJc022UC7luiM3W3sZ0J6gsw224Ce
X-Received: by 2002:a5d:61c2:0:b0:374:c4e2:ee00 with SMTP id ffacd0b85a97d-378c2d727cdmr6923396f8f.53.1726401384063;
        Sun, 15 Sep 2024 04:56:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyEs6C2aHrXZAIOA5W3sOkYTlvl132AmRDwfpcPbn4TwLRy5jpeGsJo0CyZLSDctv+kbwANA==
X-Received: by 2002:a5d:61c2:0:b0:374:c4e2:ee00 with SMTP id ffacd0b85a97d-378c2d727cdmr6923382f8f.53.1726401383472;
        Sun, 15 Sep 2024 04:56:23 -0700 (PDT)
Received: from redhat.com ([2.52.158.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e6f2486esm4605474f8f.0.2024.09.15.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 04:56:22 -0700 (PDT)
Date: Sun, 15 Sep 2024 07:56:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH v1 0/2] Embed files as PDF attachments
Message-ID: <20240915073746-mutt-send-email-mst@kernel.org>
References: <v1-proposal-attachfiles.manos.pitsidianakis@linaro.org>
 <20240915071049-mutt-send-email-mst@kernel.org>
 <CAAjaMXY82XdxFYnfgzkuSoCKCJ8Dk+_VTowgjmae+Og5Ko=7=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAjaMXY82XdxFYnfgzkuSoCKCJ8Dk+_VTowgjmae+Og5Ko=7=w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Sep 15, 2024 at 02:31:26PM +0300, Manos Pitsidianakis wrote:
> On Sun, 15 Sept 2024 at 14:11, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sun, Sep 15, 2024 at 10:56:29AM +0300, Manos Pitsidianakis wrote:
> > > The PDF specs allow for file attachments to documents. This can be used
> > > to make the VIRTIO PDF spec a single source of truth by embedding
> > > related files.
> > >
> > > This series attaches the virtio-queue.h header file as a proof of
> > > concept. It can be inspected and extracted using a compliant PDF viewer
> > > such as Adobe's or Firefox's integrated PDF reader.
> > >
> > > (Note: I'm not sure if Chrome supports it, my local version does not,
> > > neither does Chromium.)
> > >
> > > Programmatically extracting files is also possible, allowing for
> > > downstream projects to update their headers by accessing the upstream
> > > pdf file.
> > >
> > > Example using the `pdfdetach` utility from the Xpdf package of tools
> > > (`poppler-utils` package on debian/ubuntu):
> > >
> > >   $ pdfdetach -list virtio-v1.3-csd01.pdf
> > >   1 embedded files
> > >   1: virtio-queue.h
> > >   $ pdfdetach -save 1 virtio-v1.3-csd01.pdf
> > >   $ file virtio-queue.h
> > >   virtio-queue.h: C source, ASCII text
> >
> >
> > Really cool, thank you Manos!
> 
> Hello Michael,
> 
> Forgot to mention on my cover letter: We are interested in this not
> just for virtio-queue.h but for defining normative definitions of
> constants and memory layouts of structures for transports/devices. For
> example if we take all the inline code listings of a device \section
> and generate a file (to avoid having them checked into source control
> and have two instances/sources of truth of the definitions, tex and .h
> files) we can add a final \subsection at the end, for example
> something like:
> 
> diff --git a/device-types/sound/description.tex
> b/device-types/sound/description.tex
> index 54c9c8e..d79e66e 100644
> --- a/device-types/sound/description.tex
> +++ b/device-types/sound/description.tex
> @@ -1177,3 +1177,9 @@ \subsubsection{Control
> Elements}\label{sec:Device Types / Sound Device / Device
>  \begin{itemize}
>  \item The device MUST NOT set undefined \field{mask} values.
>  \end{itemize}
> +
> +\subsection[virtio-snd.h]{virtio-snd.h}\label{sec:virtio-snd.h}
> +\label{sec:virtio-snd.h}
> +\attachsource{virtio-snd.h}
> +All definitions in this header file are for normative reference.

Yes, we could import the headers from Linux.

> Also, I have made changes to show the filename instead of an icon and
> attached a screenshot of how it appears in my Firefox (with the cursor
> hovering over the filename link).

Sounds good.
Getting ready for LPC so don't have the time to test it properly.

> 
> > > Manos Pitsidianakis (2):
> > >   specvars.tex: Add \virtioauthor command
> > >   Embed virtio-queue.h as PDF attachment
> > >
> > >  commands-html.tex |  7 +++++++
> > >  commands-pdf.tex  | 10 ++++++++++
> > >  headerfile.tex    |  2 ++
> > >  specvars.tex      |  3 ++-
> > >  virtio.tex        |  1 +
> > >  5 files changed, 22 insertions(+), 1 deletion(-)
> > >
> > >
> > > base-commit: b495841a8e80d12c1130f8868f4128866291142d
> > > --
> > > γαῖα πυρί μιχθήτω
> > >
> >
> 
> 
> -- 
> Manos Pitsidianakis
> Emulation and Virtualization Engineer at Linaro Ltd


