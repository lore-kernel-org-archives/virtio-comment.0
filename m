Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36631482E8
	for <virtio-comment@lists.linux.dev>; Wed, 12 Nov 2025 05:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762925483; cv=none; b=DGT+/Ac+bqPwWSfY5qcd3KdKwQeuQWyTMUuHdjH7O24UFAtib7W4enQb4yEhL+PzONrZVT3FABcdIjwVXkBqieTEg11nsy4ZwxLPgZaGqbkMbOU8zggYdhQ3R++Hf6nmDvXfa/00bUk+xa1m1UyRBDIT6ivQNG4XD21nNGcWJys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762925483; c=relaxed/simple;
	bh=UrZtZYVLRG7by6GDjiKaXTGb00a94gnsLhVPF892eAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxtzyEMYDeZwvukjnkSCMcialMuOPP627HnN7ilcnfDaKtT3MvtQWeY6tTSBh1Wlbz1YmuCSs4okPV9Bjl37hktfPMQtpiKSIVkEzSp4DtRLDZvWabHAWCpK++VgqLgzm+CN+nNLoZz9Io4tW92SDEYyIU37gT3io0WRD4RAp7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FoyMkvno; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FoyMkvno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762925479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=74KELeIS/Oqc9Dk0oJqKqtosYfNTSawI/UDcVFNOEFs=;
	b=FoyMkvno9M85FeUZLS38cfgxirrhmcB98NdYl7WKPXRdWwgIz4tTnDdn2wgWjf3QrCMgn0
	SkABHJEn9LpGHw8+cuS/9P32qDxzyxZxQmFlhszfRB+EwZQTLQDWRIgO1u8rxD487xXEv/
	YLpdveTNl/+lT9CTAcmt8pOpAvvqatU=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354--x5hw3S9MxO3m3hbbNmzQA-1; Wed, 12 Nov 2025 00:31:18 -0500
X-MC-Unique: -x5hw3S9MxO3m3hbbNmzQA-1
X-Mimecast-MFC-AGG-ID: -x5hw3S9MxO3m3hbbNmzQA_1762925478
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-65703b66ebfso740371eaf.0
        for <virtio-comment@lists.linux.dev>; Tue, 11 Nov 2025 21:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762925477; x=1763530277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=74KELeIS/Oqc9Dk0oJqKqtosYfNTSawI/UDcVFNOEFs=;
        b=IRGus+3R3rNZo8ioC2m5HOEeJUGOushpXOa+mRS0hQ/MjnG5txc090DAiiU9c5Fap6
         o1E/GUBVpgLvnnKxVcM0I8DdBK+C6xmWpWkesLRqsccUeTb+wHPi2Az7o9lZ+kpbTZKb
         EhLSh5tz9IInXTuyBuJ5kl/xp2eMWnMi2UkkGmdOCxXcBTPtXqaoXiYeLjsCdcxUwyL6
         J8W91t7SiieUZOV8KLi8keWyq2AfohhlaUuvQIMrNUERpKbNDtnH+i9puVTKZU0foP+k
         xbvanqOCFRW2+U9OZt9XrjeDs61jGHeLHqu/TXU43TMk9+t/1jJEGsZap7/YaFbSjE9/
         Ul1w==
X-Forwarded-Encrypted: i=1; AJvYcCXSu96CaYelyMe7BG4OXL9n5Cao1sTC3e4FOB3z0aYZCAEq0anzt7KHMWq4vvMHNrPXpFY2mtBAA2TkM7ynag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw26i2vebiIDhH6Ttf8y+gGdzxrh9fpZ2bmmHtfUviEUEup/Dvf
	WlEw7BrAj2fEhW0j55icCHKe4PKjSTEeCWn2EkzchyTKtdHYNmmpsIRHdDcMQuUd1jR90f7SHcK
	CJtQ53FCIhtLSxG0IWoOkQLa2YFAfMq9uIQcreBIAmGrxI4a6UGAhrNw1ySdF4eGDGNjG1CpkWW
	ONSMY1wfM04eW4sX7YUIQiBbRpQ63WxnbSZKO7Vpn/0Ec=
X-Gm-Gg: ASbGncuGQIvRIl3soz3P8i6S+mYnZYjEC0vsOgZkKHdP2PKbOVonlEtP6D5AnUi4unx
	8ZdUCHGFPStzNnZCcK7AtLWVXoK9TkRzpfNRDXQrM5bJBOEgVcjF3273H3kulwaUzh5Zj2mIGBq
	GBTjf3MLTM+G1MTqV+Ax635UMkpbT1OChc9iNj5BmOhZ1o0GAZV4Yyq7Dc
X-Received: by 2002:a05:6871:6618:b0:3b0:31e5:a6bc with SMTP id 586e51a60fabf-3e832230bf5mr996991fac.0.1762925477581;
        Tue, 11 Nov 2025 21:31:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNcB6MYVb1mGlie38fIG2GERdycfg0+x+A6Fy9BNqgjKcm7pe79t6JV+ig+ysrjCcqVlMlmZqrHoS9kVuBD8g=
X-Received: by 2002:a05:6871:6618:b0:3b0:31e5:a6bc with SMTP id
 586e51a60fabf-3e832230bf5mr996984fac.0.1762925477184; Tue, 11 Nov 2025
 21:31:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250917071249.1689417-1-afaria@redhat.com> <20250917192622.GC172838@fedora>
In-Reply-To: <20250917192622.GC172838@fedora>
From: Alberto Faria <afaria@redhat.com>
Date: Wed, 12 Nov 2025 05:30:40 +0000
X-Gm-Features: AWmQ_bnvxUqCrPAhbF6Lm1EciVusxnrn7uJ13qr4z-Gq3ptdLS_S4Jx5d6onI1o
Message-ID: <CAELaAXyuqgwD9z8PQtXfO+hBxjp_Gthm+qpo14pi=q7S+71cLg@mail.gmail.com>
Subject: Re: [PATCH v3] virtio-blk: Add support for "Force Unit Access" writes
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: dverkamp@chromium.org, mst@redhat.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sI5-qGIInZeoC4C-yjKHZuPbkwKh5PyQJZStyE8QYqE_1762925478
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 2:38=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
> On Wed, Sep 17, 2025 at 08:12:49AM +0100, Alberto Faria wrote:
> > Add a VIRTIO_BLK_F_REQ_FLAGS feature bit converting the current
> > `virtio_blk_req::reserved` field into a `flags` bit field, which can be
> > used to modify the behavior of an entire request.
> >
> > Define one of the bits as signaling that a VIRTIO_BLK_T_OUT request
> > should be a "Force Unit Access" (FUA) write, i.e., should become stable
> > once the request completes. FUA writes enable better performance
> > compared to the alternative of waiting for a write to complete and
> > subsequently submitting a flush.
> >
> > Leave the remaining 31 bits reserved for now.
> >
> > Also add a VIRTIO_BLK_F_REQ_FLAGS_FUA feature bit indicating device
> > support for the aforementioned FUA bit.
> >
> > This approach allows for future expansion to other request-level flags
> > that may each be applicable to all or just a subset of request types.
> > The VIRTIO_BLK_F_REQ_FLAGS feature bit ensures compatibility with legac=
y
> > devices/drivers that interpret the previously-`reserved` field as a
> > priority indicator.
> >
> > Signed-off-by: Alberto Faria <afaria@redhat.com>
> > ---
> >
> > QEMU + kernel patchsets and some performance numbers to follow.
> >
> > v3:
> > - Changed to a more future-proof approach somewhat similar to what was
> >   suggested by Stefan.
> > - Included a brief rationale for the introduction of FUA write requests=
,
> >   as suggested by Michael.
> >
> > v2:
> > - Redefine VIRTIO_BLK_T_OUT_FUA to 27 since 15 is already in use.
> > - Clarify that the cache mode has no impact on VIRTIO_BLK_T_OUT_FUA
> >   semantics.
> > - Allow drivers to negotiate VIRTIO_BLK_F_OUT_FUA even if they are
> >   incapable of sending VIRTIO_BLK_T_OUT_FUA commands.
> >
> >  device-types/blk/description.tex | 50 +++++++++++++++++++++++++++-----
> >  1 file changed, 43 insertions(+), 7 deletions(-)
> >
> > diff --git a/device-types/blk/description.tex b/device-types/blk/descri=
ption.tex
> > index 2712ada..6f80451 100644
> > --- a/device-types/blk/description.tex
> > +++ b/device-types/blk/description.tex
> > @@ -66,6 +66,13 @@ \subsection{Feature bits}\label{sec:Device Types / B=
lock Device / Feature bits}
> >       (ZNS). For brevity, these standard documents are referred as "ZBD=
 standards"
> >       from this point on in the text.
> >
> > +\item[VIRTIO_BLK_F_REQ_FLAGS (18)] Device can interpret the \field{fla=
gs} field
> > +    in the \field{virtio_blk_req} structure.
> > +
> > +\item[VIRTIO_BLK_F_REQ_FLAGS_FUA (19)] Device supports the Force Unit =
Access
> > +    (FUA) flag in the \field{flags} field of the \field{virtio_blk_req=
}
> > +    structure for VIRTIO_BLK_T_OUT requests.
> > +
> >  \end{description}
> >
> >  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types =
/ Block Device / Feature bits / Legacy Interface: Feature bits}
> > @@ -402,6 +409,9 @@ \subsection{Device Initialization}\label{sec:Device=
 Types / Block Device / Devic
> >  \item the device MUST initialize padding bytes \field{unused2} to 0.
> >  \end{itemize}
> >
> > +If VIRTIO_BLK_F_REQ_FLAGS is not negotiated, then VIRTIO_BLK_F_REQ_FLA=
GS_FUA
> > +also MUST NOT be negotiated.
>
> Please structure this as:
>
>   \drivernormative
>   ...
>   The driver MUST NOT negotiate VIRTIO_BLK_F_REQ_FLAGS_FUA without
>   VIRTIO_BLK_F_REQ_FLAGS.
>
>   \devicenormative
>   ...
>   The device MUST NOT acknowledge FEATURES_OK if the driver sets
>   VIRTIO_BLK_F_REQ_FLAGS_FUA without VIRTIO_BLK_F_REQ_FLAGS.
>
> That way driver authors also have a conformance clause informing them
> that FUA requires request flags.

Will do.

> > +
> >  \subsubsection{Legacy Interface: Device Initialization}\label{sec:Devi=
ce Types / Block Device / Device Initialization / Legacy Interface: Device =
Initialization}
> >
> >  Because legacy devices do not have FEATURES_OK, transitional devices
> > @@ -434,7 +444,10 @@ \subsection{Device Operation}\label{sec:Device Typ=
es / Block Device / Device Ope
> >  \begin{lstlisting}
> >  struct virtio_blk_req {
> >          le32 type;
> > -        le32 reserved;
> > +        struct {
> > +                le32 fua:1;
> > +                le32 reserved:31;
> > +        } flags;
>
> FUA only has meaning for certain request types. I think it's worth
> stating that the meaning of the flags field is specific to each request
> type. That way there are more bits available in the future and there is
> no need to specify how invalid flag bits are handled for the other
> request types.

I think this adds some complexity that may not be worth it if we're
confident 32 bits shared across all requests will always be enough.
Will do it regardless in the next version so we can compare.

> >          le64 sector;
> >          u8 data[];
> >          u8 status;
> > @@ -459,6 +472,9 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Block Device / Device Ope
> >  #define VIRTIO_BLK_T_SECURE_ERASE   14
> >  \end{lstlisting}
> >
> > +The \field{flags} field is entirely reserved unless VIRTIO_BLK_F_REQ_F=
LAGS is
> > +negotiated.
>
> This statement might be interpreted as "the flags field is zero when
> VIRTIO_BLK_F_REQ_FLAGS is not negotiated" by device implementors. The
> Linux driver populates it with the request's I/O priority even for
> non-legacy devices, so it might not be zero.
>
> How about:
>
>   The \field{flags} field is ignored by the device unless
>   VIRTIO_BLK_F_REQ_FLAGS is negotiated.

Sounds good.

> > +
> >  The \field{sector} number indicates the offset (multiplied by 512) whe=
re
> >  the read or write is to occur. This field is unused and set to 0 for
> >  commands other than read, write and some zone operations.
> > @@ -873,6 +889,14 @@ \subsection{Device Operation}\label{sec:Device Typ=
es / Block Device / Device Ope
> >
> >  A driver SHOULD accept the VIRTIO_BLK_F_RO feature if offered.
> >
> > +If VIRTIO_BLK_F_REQ_FLAGS is negotiated:
> > +
> > +\begin{itemize}
> > +\item A driver MUST NOT set the \field{fua} bit in \field{flags} unles=
s the
> > +    VIRTIO_BLK_F_REQ_FLAGS_FUA feature is negotiated and the request t=
ype is
> > +    VIRTIO_BLK_T_OUT.
> > +\end{itemize}
> > +
> >  A driver MUST set \field{sector} to 0 for a VIRTIO_BLK_T_FLUSH request=
.
> >  A driver SHOULD NOT include any data in a VIRTIO_BLK_T_FLUSH request.
> >
> > @@ -962,9 +986,15 @@ \subsection{Device Operation}\label{sec:Device Typ=
es / Block Device / Device Ope
> >  operation of the device. When this happens, the device SHOULD trigger =
a
> >  configuration change notification.
> >
> > -A device MUST set the \field{status} byte to VIRTIO_BLK_S_IOERR
> > -for a write request if the VIRTIO_BLK_F_RO feature if offered, and MUS=
T NOT
> > -write any data.
> > +A device MUST set the \field{status} byte to VIRTIO_BLK_S_IOERR for a =
write
> > +request and MUST NOT write any data if any of the following conditions=
 is true:
> > +
> > +\begin{itemize}
> > +\item the VIRTIO_BLK_F_RO feature if offered.
> > +
> > +\item the VIRTIO_BLK_F_REQ_FLAGS feature was negotiated and the \field=
{fua} bit
> > +    in \field{flags} is set but VIRTIO_BLK_F_REQ_FLAGS_FUA was not neg=
otiated.
>
> This statement is in conflict with backwards compatibility. Consider the
> case where a new request flag called FOO is added to the spec after this
> patch is merged and it uses the same language:
>
>   \item the VIRTIO_BLK_F_REQ_FLAGS feature was negotiated and the
>   \field{foo} bit in \field{flags} is set but VIRTIO_BLK_F_REQ_FLAGS_FOO
>   was not negotiated.
>
> Existing devices don't know about REQ_FLAGS_FOO but the spec now says
> they must fail the request with VIRTIO_BLK_S_IOERR if the foo bit is set
> without VIRTIO_BLK_F_REQ_FLAGS_FOO.
>
> New behavior for FUA can only be introduced when
> VIRTIO_BLK_F_REQ_FLAGS_FUA has been negotiated. I think that requires
> dropping this statement from this patch. (Technically it works in this
> patch because VIRTIO_BLK_F_REQ_FLAGS is also introduced in the same
> patch, but it won't be possible for future flags bits and therefore it
> is strange to treat FUA differently.)

Will fix.

> > +\end{itemize}
> >
> >  The device MUST set the \field{status} byte to VIRTIO_BLK_S_UNSUPP for
> >  discard, secure erase and write zeroes commands if any unknown flag is=
 set.
> > @@ -1000,14 +1030,20 @@ \subsection{Device Operation}\label{sec:Device =
Types / Block Device / Device Ope
> >    \field{writeback} field in configuration space was 0 \textbf{all the=
 time between
> >    the submission of the write and its completion};
> >
> > -\item\label{item:flush3} a VIRTIO_BLK_T_FLUSH request is sent \textbf{=
after the write is
> > +\item\label{item:flush3} the VIRTIO_BLK_F_REQ_FLAGS_FUA feature was ne=
gotiated
> > +  and the \field{fua} bit in \field{flags} was set in the write reques=
t
> > +  (regardless of whether the VIRTIO_BLK_F_FLUSH or VIRTIO_BLK_F_CONFIG=
_WCE
> > +  features were negotiated, and regardless of the current cache mode a=
s
> > +  expressed by the value of the \field{writeback} field in configurati=
on space).
>
> Missing "and the write request is completed"?

This should be implied by the paragraph above the itemize.

Thanks for the review,
Alberto

> > +
> > +\item\label{item:flush4} a VIRTIO_BLK_T_FLUSH request is sent \textbf{=
after the write is
> >    completed} and is completed itself.
> >  \end{enumerate}
> >
> >  If the device is backed by persistent storage, the device MUST ensure =
that
> >  stable writes are committed to it, before reporting completion of the =
write
> > -(cases~\ref{item:flush1} and~\ref{item:flush2}) or the flush
> > -(case~\ref{item:flush3}).  Failure to do so can cause data loss
> > +(cases~\ref{item:flush1}, \ref{item:flush2} and~\ref{item:flush3}) or =
the flush
> > +(case~\ref{item:flush4}).  Failure to do so can cause data loss
> >  in case of a crash.
> >
> >  If the driver changes \field{writeback} between the submission of the =
write
> > --
> > 2.51.0
> >

