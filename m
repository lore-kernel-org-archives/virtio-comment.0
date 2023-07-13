Return-Path: <virtio-comment-return-6855-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5789EB64DD
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Jul 2023 11:01:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C9E252AC51
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Jul 2023 11:01:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AA1C19867CB
	for <virtio-comment@archiver.kernel.org>; Thu, 13 Jul 2023 11:01:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8F7469867C1; Thu, 13 Jul 2023 11:01:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D33C9867C2
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Jul 2023 11:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KW3PRWNBNIevX0CbQXOP4A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689246060; x=1691838060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VI/Z9Y8tNTuVtSng43MbozSdSgo6F9Sq+DUvW/6sv0=;
        b=kLtmy6TAamOzr0SdYq6Pn462nYccnIgdiCXlOaJR6A8lqYeSaNi0jvKizAAAlNVrGL
         ESwAP/Vb/V0eOBERF+dyA7m+2JArwhIb23Ba5b0GULtXI9BQudu2JpoS7ywFCJ1FXqsE
         oQ7g1Ul2P/jUosR+wux+aIoJ7TJBzbhtUjTd9nVidH/ihEBQRdaVtzw15eA+WbJYjQt5
         4/GBMFgaosjVgnbFjdz0bq0r1oIONWkvy9nN4VD3kv5BtGvR6GFKv030PcPZYDP63W7D
         T4S+GU818VtORujp6ZIzmmxL34x7ZDZC7EIu+MF7tjbRBFlNVBugjo5AJx7cKzm6XN8V
         86Fg==
X-Gm-Message-State: ABy/qLa39FAPNk8dCA0vMV398quJ2oxVW4Ld/fTwtKRWRUzGUdoTqRjY
	zjTKqAuNxrCjtMGlhKgV1WahLidKfA1/76jRlwJv/9lniBJZ1q91aoHpBWS4IBldR2hVOFz7j5C
	0kyRY6fVYJrn5n8i4UGh0Fw3f31BCO4i8fw==
X-Received: by 2002:adf:f887:0:b0:316:cbb4:4e49 with SMTP id u7-20020adff887000000b00316cbb44e49mr1248265wrp.1.1689246060261;
        Thu, 13 Jul 2023 04:01:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFX68PlztXslh+QdMFmyxyw55hGTwugAJ28f6lrSLO0zW2+h40oLLkIyT2HjS/ce7XE2h3yEQ==
X-Received: by 2002:adf:f887:0:b0:316:cbb4:4e49 with SMTP id u7-20020adff887000000b00316cbb44e49mr1248247wrp.1.1689246059868;
        Thu, 13 Jul 2023 04:00:59 -0700 (PDT)
Date: Thu, 13 Jul 2023 07:00:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org, hengqi@linux.alibaba.com,
	shahafs@nvidia.com
Message-ID: <20230713065951-mutt-send-email-mst@kernel.org>
References: <20230712222405.455201-1-parav@nvidia.com>
 <87zg40qioi.fsf@redhat.com>
 <87r0pcqhqn.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87r0pcqhqn.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 0/4] Short document fixes to inner
 hash feature

On Thu, Jul 13, 2023 at 11:32:32AM +0200, Cornelia Huck wrote:
> On Thu, Jul 13 2023, Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Thu, Jul 13 2023, Parav Pandit <parav@nvidia.com> wrote:
> >
> >> This short patches fixes the editing errors that stops the pdf and html
> >> generation.
> >>
> >> These 3 fixes are for the patch [1] for the github issue [2].
> >>
> >> [1] https://lists.oasis-open.org/archives/virtio-comment/202307/msg00024.html
> >> [2] https://github.com/oasis-tcs/virtio-spec/issues/173
> >>
> >> Patch summary:
> >> patch-1 place C code under listing
> >> patch-2 avoid hyphen and extra braces
> >> patch-3 use table as hyperlink do not work well in C code listing
> >> patch-4 refer 'advice' as 'note'
> >>
> >> Patch 1 to 3 appears to be must in the testing.
> >> Patch 4 is not a fix and can be done later if it requires discussion.
> >>
> >> Parav Pandit (4):
> >>   virtio-net: Place C code under listing
> >>   virtio-net: Avoid hyphen and extra braces
> >>   virtio-net: Use table to describe inner hash to rfc mapping
> >>   virtio-net: Use note instead of advice
> >>
> >>  device-types/net/description.tex | 45 ++++++++++++++++++++++----------
> >>  introduction.tex                 | 15 +++++------
> >>  2 files changed, 38 insertions(+), 22 deletions(-)
> >>
> >
> > FTR, this is the diff I have locally (I had missed one underscore in the
> > references yesterday...); maybe we can make the intra-reference links in
> > introdcution.tex a bit nicer, but otherwise, this should be the minimal
> > change to make this build:
> 
> For the "make it look nicer" part, I think this one would get the job
> done; opinions?
> 
> diff --git a/introduction.tex b/introduction.tex
> index 6f10a94b6fde..1e39a4b2c529 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -106,8 +106,8 @@ \section{Normative References}\label{sec:Normative References}
>      Generic Routing Encapsulation. This protocol is only specified for IPv4 and used as either the payload or delivery protocol.
>  	\newline\url{https://datatracker.ietf.org/doc/rfc2784/}\\
>  	\phantomsection\label{intro:rfc2890}\textbf{[RFC2890]} &
> -    Key and Sequence Number Extensions to GRE \ref{intro:rfc2784}. This protocol describes extensions by which two fields, Key and
> -    Sequence Number, can be optionally carried in the GRE Header \ref{intro:rfc2784}.
> +    Key and Sequence Number Extensions to \hyperref[intro:rfc2784]{GRE}. This protocol describes extensions by which two fields, Key and
> +    Sequence Number, can be optionally carried in the \hyperref[intro:rfc2784]{GRE} Header.

This does look nicer.

>  	\newline\url{https://www.rfc-editor.org/rfc/rfc2890}\\
>  	\phantomsection\label{intro:rfc7676}\textbf{[RFC7676]} &
>      IPv6 Support for Generic Routing Encapsulation (GRE). This protocol is specified for IPv6 and used as either the payload or


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

