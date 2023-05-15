Return-Path: <virtio-comment-return-5908-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5759C77B75
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:32:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 232AA4434B
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:32:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 171E0986514
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 15:32:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0F4879864EE; Mon, 15 May 2023 15:32:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F05DA986509
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 15:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684164720; x=1686756720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbVJtc1UP1N9B9tXaK4L/CPneyuJyGGZkIZe6Jl4Iq4=;
        b=B1La3RNdZYhfiTP08ikGuh7B4JBBh0Ng/GMW9mV1aEQ7pC681nuWM8MTAH14MTboM9
         Q3jPpbMyS1l34GFsRBvjGW+uJG6FwTmp9MSNwdNCq65+TDTpCRuHTjsSnegiKXI5tq9M
         3I+pHmenGtRXkItNd6tnxGFb7+TbW6Snd/+HPrAusFz5xYh0MVccg+PWNotk2rSrF/Mi
         Hgqmv4Ob1wlKYSAJoQPaDk85D1hq02K73TvaQlPwtG8ko6ufj9wVKnd73cGYeV7xgEUK
         RogrJMMvqwo3dqgd8+mOJApvCUDWtdyuhz1ClpRo07oWH5/Ow0bv41+aMwAe8aUKZ9Tj
         1znQ==
X-Gm-Message-State: AC+VfDxhkz+56X3gKhjO4VJiIno3ueChz9Qc2e/o7KxRY42ysHQKHJT4
	LUfUY/S6PJOoWvg8zRsTFafJjPsqYjHYv5fy/2tIoLTCPY3/oxGrZTs=
X-Google-Smtp-Source: ACHHUZ5nRXsV4fjThPdN7wUVBvLWSX6VQgE4LIqSzYQ91JpnBP9NiPgJAkjpqq6CQB3serww18wYiQWV8z9Y5Js96KQ=
X-Received: by 2002:a05:600c:3ca5:b0:3f1:80d0:906b with SMTP id
 bg37-20020a05600c3ca500b003f180d0906bmr23604005wmb.4.1684164719938; Mon, 15
 May 2023 08:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <CABmGT5FVRj9=vrekhCOWwQnO2eOHDt8pA35hef+=BLN7fWi5=Q@mail.gmail.com>
 <877ct939qv.fsf@redhat.com>
In-Reply-To: <877ct939qv.fsf@redhat.com>
From: "T.J. Alumbaugh" <talumbau@google.com>
Date: Mon, 15 May 2023 09:31:23 -0600
Message-ID: <CABmGT5EW_D7DWKM5WAGruyvyDiNv8R8_hGZXUvDc3itUZLeaQw@mail.gmail.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="000000000000e0857505fbbd27c7"
Subject: Re: [virtio-comment] trouble sending patch with git send-email

--000000000000e0857505fbbd27c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 9:17=E2=80=AFAM Cornelia Huck <cohuck@redhat.com> w=
rote:
>
>
> Just to make sure it's not something obvious: Have you double checked
> that the author in git matches the address you subscribed with? Because
> this mail came through, and having the author set to a different address
> without realizing it is something that happens a lot.
>

Thanks for the suggestion. I confirmed that the Author for the git commit
matches this email address:

Author: T.J. Alumbaugh <talumbau@google.com>

I also generated a cover letter for the patch, since it seems reasonable to
include a significant "Motivation" section for a spec addition. That step
is actually not in the guidance, but other than that, it's a pretty
"vanilla" patch as far as I can tell. Is it undesirable to send cover
letters for patches?

-T.J.




On Mon, May 15, 2023 at 9:17=E2=80=AFAM Cornelia Huck <cohuck@redhat.com> w=
rote:

> On Mon, May 15 2023, "T.J. Alumbaugh" <talumbau@google.com> wrote:
>
> > Hi,
> >
> > I'm having an issue trying to send a proposed spec change for
> > discussion to this list. I'm following the instructions here:
> >
> > https://github.com/oasis-tcs/virtio-spec#providing-feedback
> >
> > which seem to be pretty standard and the typical workflow for sending
> > git patches. However, my messages bounce with this error:
> >
> > <virtio-comment@lists.oasis-open.org>: permission denied. Command
> output:
> >     Traceback (most recent call last):   File
> >     "/home/oasis/bin/kmlm_crosspost_issubn", line 14, in <module>
>  import
> >     MySQLdb ImportError: No module named MySQLdb Sorry, only subscriber=
s
> may
> >     post. If you are a subscriber, please forward this message to
> >     virtio-comment-owner@lists.oasis-open.org to get your new address
> included
> >     (#5.7.2) ERROR: postqmail-local Error #77
> >
> >
> > I have confirmed that I am a subscriber to this list. This email
> > itself will serve as an experiment to determine if the message is
> > legitimate (the system believes I am not a subscriber), or if this
> > error is spurious and there is some other issue with sending a patch
> > with `git send-email`. In the event that this email does get through,
> > any advice on how to proceed would be much appreciated! Thanks,
> >
> > -T.J.
>
> Just to make sure it's not something obvious: Have you double checked
> that the author in git matches the address you subscribed with? Because
> this mail came through, and having the author set to a different address
> without realizing it is something that happens a lot.
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>
>

--000000000000e0857505fbbd27c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, May 15, 2023 at 9:17=E2=80=AFAM Cornelia H=
uck &lt;<a href=3D"mailto:cohuck@redhat.com">cohuck@redhat.com</a>&gt; wrot=
e:<br>&gt;<br>&gt;<br>&gt; Just to make sure it&#39;s not something obvious=
: Have you double checked<br>&gt; that the author in git matches the addres=
s you subscribed with? Because<br>&gt; this mail came through, and having t=
he author set to a different address<br>&gt; without realizing it is someth=
ing that happens a lot.<br>&gt;<br><br>Thanks for the suggestion. I confirm=
ed that the Author for the git commit matches this email address:<br><br>Au=
thor: T.J. Alumbaugh &lt;<a href=3D"mailto:talumbau@google.com">talumbau@go=
ogle.com</a>&gt;<div><br></div><div>I also generated a cover letter for the=
 patch, since it seems reasonable to include a significant &quot;Motivation=
&quot; section for a spec addition. That step is actually not in the guidan=
ce, but other than that, it&#39;s a pretty &quot;vanilla&quot; patch as far=
=C2=A0as I can tell. Is it undesirable to send cover letters for patches?</=
div><div><br></div><div>-T.J.</div><div><br></div><div><br></div></div><br>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, May 15, 2023 at 9:17=E2=80=AFAM Cornelia Huck &lt;<a href=3D"mailto:cohuc=
k@redhat.com">cohuck@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, May 15 2023, &quot;T.J. Alumbaugh&=
quot; &lt;<a href=3D"mailto:talumbau@google.com" target=3D"_blank">talumbau=
@google.com</a>&gt; wrote:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; I&#39;m having an issue trying to send a proposed spec change for<br>
&gt; discussion to this list. I&#39;m following the instructions here:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/oasis-tcs/virtio-spec#providing-feedback=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/oasis-tcs/virtio-=
spec#providing-feedback</a><br>
&gt;<br>
&gt; which seem to be pretty standard and the typical workflow for sending<=
br>
&gt; git patches. However, my messages bounce with this error:<br>
&gt;<br>
&gt; &lt;<a href=3D"mailto:virtio-comment@lists.oasis-open.org" target=3D"_=
blank">virtio-comment@lists.oasis-open.org</a>&gt;: permission denied. Comm=
and output:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Traceback (most recent call last):=C2=A0 =C2=A0File=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/home/oasis/bin/kmlm_crosspost_issubn&quot;, =
line 14, in &lt;module&gt;=C2=A0 =C2=A0 =C2=A0import<br>
&gt;=C2=A0 =C2=A0 =C2=A0MySQLdb ImportError: No module named MySQLdb Sorry,=
 only subscribers may<br>
&gt;=C2=A0 =C2=A0 =C2=A0post. If you are a subscriber, please forward this =
message to<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:virtio-comment-owner@lists.oasis-=
open.org" target=3D"_blank">virtio-comment-owner@lists.oasis-open.org</a> t=
o get your new address included<br>
&gt;=C2=A0 =C2=A0 =C2=A0(#5.7.2) ERROR: postqmail-local Error #77<br>
&gt;<br>
&gt;<br>
&gt; I have confirmed that I am a subscriber to this list. This email<br>
&gt; itself will serve as an experiment to determine if the message is<br>
&gt; legitimate (the system believes I am not a subscriber), or if this<br>
&gt; error is spurious and there is some other issue with sending a patch<b=
r>
&gt; with `git send-email`. In the event that this email does get through,<=
br>
&gt; any advice on how to proceed would be much appreciated! Thanks,<br>
&gt;<br>
&gt; -T.J.<br>
<br>
Just to make sure it&#39;s not something obvious: Have you double checked<b=
r>
that the author in git matches the address you subscribed with? Because<br>
this mail came through, and having the author set to a different address<br=
>
without realizing it is something that happens a lot.<br>
<br>
<br>
This publicly archived list offers a means to provide input to the<br>
OASIS Virtual I/O Device (VIRTIO) TC.<br>
<br>
In order to verify user consent to the Feedback License terms and<br>
to minimize spam in the list archive, subscription is required<br>
before posting.<br>
<br>
Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis-open.org"=
 target=3D"_blank">virtio-comment-subscribe@lists.oasis-open.org</a><br>
Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.oasis-open.=
org" target=3D"_blank">virtio-comment-unsubscribe@lists.oasis-open.org</a><=
br>
List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open.org" targ=
et=3D"_blank">virtio-comment-help@lists.oasis-open.org</a><br>
List archive: <a href=3D"https://lists.oasis-open.org/archives/virtio-comme=
nt/" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-open.org/arch=
ives/virtio-comment/</a><br>
Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/feedback_li=
cense.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/=
who/ipr/feedback_license.pdf</a><br>
List Guidelines: <a href=3D"https://www.oasis-open.org/policies-guidelines/=
mailing-lists" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.=
org/policies-guidelines/mailing-lists</a><br>
Committee: <a href=3D"https://www.oasis-open.org/committees/virtio/" rel=3D=
"noreferrer" target=3D"_blank">https://www.oasis-open.org/committees/virtio=
/</a><br>
Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"noreferrer"=
 target=3D"_blank">https://www.oasis-open.org/join/</a><br>
<br>
</blockquote></div>

--000000000000e0857505fbbd27c7--
