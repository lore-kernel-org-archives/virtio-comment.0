Return-Path: virtio-comment-return-670-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6534F985DD1
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 Feb 2019 14:20:25 +0000 (UTC)
MIME-Version: 1.0
References: <9bdf3096-734f-a921-d570-f8dfb9300868@durusau.net>
 <20190226154841-mutt-send-email-mst@kernel.org> <CAAwgnnPpbBbh3kf5d-RrJ-BmAnp5OFdZz9A6PaSzmvt33JRY_Q@mail.gmail.com>
 <20190227090845-mutt-send-email-mst@kernel.org>
In-Reply-To: <20190227090845-mutt-send-email-mst@kernel.org>
From: Chet Ensign <chet.ensign@oasis-open.org>
Date: Wed, 27 Feb 2019 09:20:08 -0500
Message-ID: <CAAwgnnNL6RYc29vZjt67N5JzQCVrGDdZkwnX8x5F0FOpnmf1iQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a4e1350582e0dff4"
Subject: [virtio-comment] Re: [tab] Re: [virtio-comment] TAB comments on Virtual I/O Device
 (VIRTIO) Version 1.1
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Patrick Durusau <patrick@durusau.net>, virtio-comment@lists.oasis-open.org, OASIS TAB <tab@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000a4e1350582e0dff4
Content-Type: text/plain; charset="UTF-8"

Will do - sorry that I can't get it to the github issues for you; JIRA
though is straightforward.

On Wed, Feb 27, 2019 at 9:10 AM Michael S. Tsirkin <mst@redhat.com> wrote:

> Thanks! Yes please do. We mostly switched over to github issues but jira
> isn't too bad just for this.
>
>
> On Tue, Feb 26, 2019 at 04:29:42PM -0500, Chet Ensign wrote:
> > Michael, if it would help, I believe I can move the issues from the TAB
> JIRA to
> > the Virtio JIRA. Save you the work of importing them one by one.
> >
> > /chet
> >
> > On Tue, Feb 26, 2019 at 3:58 PM Michael S. Tsirkin <mst@redhat.com>
> wrote:
> >
> >     On Thu, Feb 21, 2019 at 05:36:51PM -0500, Patrick Durusau wrote:
> >     > Greetings!
> >     >
> >     > Members of the Technical Advisory Board endeavor to comment on all
> 30 day
> >     public review drafts.
> >     >
> >     > Comments on: Virtual I/O Device (VIRTIO) Version 1.1 CS01 PRD01 are
> >     attached.
> >     >
> >     > It isn't necessary to acknowledge each comment separately. A
> single email
> >     acknowledging this email will be sufficient.
> >     >
> >     > When the TC has acted on these issues, I would appreciate a
> pointer to
> >     the TCs resolution as the TAB is tracking the resolution of comments
> from
> >     TAB members.
> >     >
> >     > Hope everyone is having a great week!
> >     >
> >     > Patrick
> >
> >
> >     Thanks a lot for the comments!
> >     I will try to split this CSV up and create github issues
> >     so it is easier to address individual comments.
> >
> >
> >
> >
> >     > --
> >     > Patrick Durusau
> >     > patrick@durusau.net
> >     > Technical Advisory Board, OASIS (TAB)
> >     > Editor, OpenDocument Format TC (OASIS), Project Editor ISO/IEC
> 26300
> >     > Co-Editor, ISO/IEC 13250-1, 13250-5 (Topic Maps)
> >     >
> >     > Another Word For It (blog): http://tm.durusau.net
> >     > Homepage: http://www.durusau.net
> >     > Twitter: patrickDurusau
> >     >
> >
> >     > Issue key,Issue id,Affects Version/s,Issue Type,Custom field
> >     (Proposal),Description
> >     > TAB-1674,47718,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Change
> >     bulleted lists into numbered lists and *always* introduce a list
> with the
> >     number of items to follow.,"Understanding and navigation of content
> is
> >     impaired by the use of bulleted lists. Compare for example,
> 2.7.21.1, being
> >     read aloud and being able to answer/find, where is your place in
> this list,
> >     as opposed to the second bulleted list in 2.7 Packed Virtqueues, or
> either
> >     of the lists/sub-lists in 2.6.10.1."
> >     > TAB-1673,47717,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Devise
> and
> >     insert uniform start and end markers for examples.,"Most of the
> examples of
> >     memory structures being with struct but not all. Moreover, most
> examples
> >     end with }; but not all, for example, under 2.7.21.3.
> >     >
> >     > My usual accessibility checker is offline but if you were reading
> the
> >     text aloud, if the start and end of examples is not uniformly
> signaled to
> >     someone hearing the text, the examples would be much harder to
> contrast
> >     with the surrounding normative text.
> >     >
> >     > An accessibility issue?? in general but also a personal one
> because after
> >     nearly 30 years as a diabetic my vision remains normal, but they
> can't
> >     promise how much longer that will be the case. Adding uniform start
> and end
> >     markers won't inconvenience sighted readers and will enhance access
> to your
> >     work for those using assistive technologies."
> >     > TAB-1672,47716,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,"We
> read in
> >     7.4:
> >     >
> >     > ""A non-transitional implementation conforms to this specification
> if it
> >     satisfies all of the MUST or REQUIRED level requirements defined
> above. ""
> >     >
> >     > Is that true? ALL the ""MUST"" in all previous sections? Probably
> not. Or
> >     maybe it is ""below"" and not ""above"". (always explicitly refer to
> >     requirements sets by using a sub-section number & name)
> >     >
> >     > I suggest to make ""transitional"" just a variable (i.e. a
> parameter) in
> >     previous top-level conf clauses. (see TAB conformance guideline
> [http://
> >     docs.oasis-open.org/templates/TCHandbook/ConformanceGuidelines.html,
> >     section 5.5)??|http://docs.oasis-open.org/templates/TCHandbook/
> >     ConformanceGuidelines.html)]E.g. someone claiming conformance as
> ""PCI
> >     driver"" should always clarify: ""transitional PCI driver"" or
> >     ""non-transitional PCI driver"""
> >     > TAB-1671,47715,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,"Each
> >     conformance clause sub-section starts with something that looks like
> a
> >     mandatory requirement:
> >     >
> >     > e.g.:
> >     >
> >     > ""A network device MUST conform to the following normative
> statements:""
> >     >
> >     > But many of the following statements are optional (SHOULD) in the
> >     specification body. So it is then confusing to say ""... MUST
> conform to a
> >     SHOULD statement....""
> >     >
> >     > That is why it is NOT recommended to use normative language like
> MUST
> >     (and even less SHOULD) in a conformance clause. A conf clause is not
> there
> >     to tell you what to do or not do (MUST....), but only to state under
> which
> >     conditions you can claim conformance to XYZ.
> >     >
> >     > It is better to say:
> >     >
> >     > ""an implementation that satisfies all mandatory (MUST)
> requirements in
> >     5.1.4.1, 5.1.6.2.... qualifies (or may claim conformance) as a
> VIRTIO1.1
> >     network device""
> >     >
> >     > Or in some conformance profiles, you can override a SHOULD in the
> spec
> >     body and make it mandatory."
> >     > TAB-1670,47714,Virtual I/O Device (VIRTIO) Version
> 1.1,Bug,,"Sections
> >     7.2.10 and 7.2.11 are never referred to, by any conformance clause.
> Same
> >     for 7.3.10 and 7.3.11.
> >     >
> >     > That seems like an omission? They should be used in at least one
> >     conformance profile each. Or else, these sections should not be
> normative."
> >     > TAB-1669,47713,Virtual I/O Device (VIRTIO) Version
> 1.1,Bug,,"Overall,
> >     well-formed conformance section (one of the best we?? TAB reviewers
> have
> >     seen!) The main conformance targets - drivers, devices - are well
> >     identified. The specification is clearly attributing normative
> requirements
> >     to either driver, or device.
> >     >
> >     > Some conformance aspects could still be clarified:
> >     >  * All the subsections under 7.2 or 7.3 are named ""clauses"" in
> 7.1. So
> >     their titles should be ""Clause XYZ"". Or else if we want to keep
> >     ""CLause"" to only the top-level set of requirements - then define
> just a
> >     couple of clauses in 7.1, e.g. ""Conformance Clause for VIRTIO1.1
> >     drivers"". Then all thee following subsections should just be titled
> >     ""Conformance requirements sets"" e.g. ""COnformance requirements
> for PCI
> >     drivers""), and preferably not ""clause"" (keeping ""clause"" for
> only??
> >     the full set of requirements that a product can claim for
> conformance).
> >     >  * In any case, it is good to associate a clear name to each
> conformance
> >     level/profile that can be claimed. For example, ""PCI network
> driver"" (if
> >     satisfying 7.2 + 7.2.1 + 7.2.4. Is that a meaningful combination?
> irt seems
> >     so according to 7.1). So that there is no ambiguity of what are the
> valid??
> >     conformance profiles. Some parameterization of a clause can be used:
> Look
> >     in TAB guideline : [http://docs.oasis-open.org/templates/TCHandbook/
> >     ConformanceGuidelines.html] for ""variable conformance clauses""
> (section
> >     5.5). In other words: define the precise statement that someone
> should use
> >     when claiming a conformance profile.
> >     >
> >     > ??"
> >     > TAB-1668,47707,Virtual I/O Device (VIRTIO) Version 1.1,Bug,"The
> >     accessibility site that I commonly use, [
> https://achecker.ca/checker/
> >     index.php,] is down tonight but use it to check your usage for other
> >     problems.
> >     >
> >     > ??","In terms of accessibility, ""what follows,"" ""below,"" and
> >     ""follows"" all inhibit the use of VIRTIO by users assisted by
> reading
> >     software.
> >     >
> >     > Take 2.2 Feature Bits as an example:
> >     >
> >     > ""Feature bits are allocated as follows:
> >     >
> >     > 0 to 23 Feature bits for the specific device type
> >     >
> >     > 24 to 37 Feature bits reserved for extensions to the queue and
> feature
> >     negotiation mechanisms
> >     >
> >     > 38 and above Feature bits reserved for future extensions.""
> >     >
> >     > A sighted reader is clued in that 3 entries follow, but reading
> software
> >     does not offer, in this form, the same clue.
> >     >
> >     > Compare:
> >     >
> >     > ""Feature bits are allocated in three ways:
> >     >
> >     > 1. 0 to 23 Feature bits for the specific device type
> >     >
> >     > 2. 24 to 37 Feature bits reserved for extensions to the queue and
> feature
> >     negotiation mechanisms
> >     >
> >     > 3. 38 and above Feature bits reserved for future extensions.""
> >     >
> >     > Same text but now both sighted as well as assisted readers know
> there are
> >     3 ways to allocate feature bits and each of those ways is numbered
> and
> >     recited to the reader.
> >     >
> >     > ??
> >     >
> >     > ??
> >     >
> >     > ??"
> >     > TAB-1667,47706,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Update
> the
> >     IEEE 802 link and re-check with [http://validator.w3.org/checklink
> ],"|[IEEE
> >     802] |IEEE Standard for Local and Metropolitan Area Networks:
> Overview and
> >     Architecture,
> >     > [http://standards.ieee.org/about/get/802/802.html], IEEE|
> >     >
> >     > reports a 404.
> >     >
> >     > Did you mean: [https://standards.ieee.org/standard/802-2001.html]??
> ??"
> >     > TAB-1666,47705,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Update
> the
> >     links indicated and re-check with http://validator.w3.org/checklink,
> "The
> >     link checker at [http://validator.w3.org/checklink] reports the
> following
> >     redirects:
> >     >
> >     > !http://validator.w3.org/checklink/images/info_icons/warning.png!
> Line:
> >     6875 [http://www.pcisig.com/] redirected to [http://pcisig.com/]
> *Status*:
> >     301 -> 200 OK
> >     >
> >     > This is a permanent redirect. The link should be updated.
> >     >
> >     > !http://validator.w3.org/checklink/images/info_icons/warning.png!
> Lines:
> >     55, 60, 63 [http://www.redhat.com/] redirected to [
> https://www.redhat.com/
> >     en] *Status*: 301 -> 200 OK
> >     >
> >     > This is a permanent redirect. The link should be updated.
> >     >
> >     > !http://validator.w3.org/checklink/images/info_icons/warning.png!
> Line:
> >     21250 [http://git.qemu-project.org/?p=qemu.git;a=blob;f=docs/specs/
> >     standard-vga.txt;hb=HEAD] redirected to [
> https://git.qemu.org/?p=qemu.git;a
> >     =blob;f=docs/specs/standard-vga.txt;hb=HEAD] *Status*: 301 -> 200 OK
> >     >
> >     > This is a permanent redirect. The link should be updated.
> >     >
> >     > !http://validator.w3.org/checklink/images/info_icons/warning.png!
> Line:
> >     768 [http://www.pcisig.com/specifications/pciexpress/] redirected
> to [http:
> >     //pcisig.com/specifications/pciexpress/] *Status*: 301 -> 200 OK
> >     >
> >     > This is a permanent redirect. The link should be updated.
> >     >
> >     > !http://validator.w3.org/checklink/images/info_icons/warning.png!
> Line:
> >     [https://www.oasis-open.org/policies-guidelines/tc-process]
> redirected to [
> >     https://www.oasis-open.org/policies-guidelines/tc-process-2017-05-26
> ]
> >     *Status*: 301 -> 200 OK
> >     >
> >     > This is a permanent redirect. The link should be updated.
> >     >
> >     > !http://validator.w3.org/checklink/images/info_icons/warning.png!
> Line:
> >     759 [http://www.pcisig.com/specifications/conventional/] redirected
> to [
> >     http://pcisig.com/specifications/conventional/] *Status*: 301 ->
> 200 OK
> >     >
> >     > This is a permanent redirect. The link should be updated."
> >     > TAB-1665,47704,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Number
> and
> >     label the in-memory structure illustrations and add anchors to enable
> >     remote pointing to particular illustrations.,"While I appreciate
> that the
> >     use of C struct syntax is illustrative only, the in-memory
> structures it
> >     documents are normative.
> >     >
> >     > And in a number of cases, those in-memory structures occur in the
> same
> >     numbered section, making reference to any specified in-memory
> structure
> >     uncertain.
> >     >
> >     > Labeling and numbering the in-memory structures (to say nothing of
> adding
> >     anchors for remote pointing), would greatly improve the usefulness
> of this
> >     document.
> >     >
> >     > ??"
> >     > TAB-1664,47703,Virtual I/O Device (VIRTIO) Version 1.1,Bug,"For
> >     consistency of presentation, the ""device and driver in-memory
> structure
> >     layouts"" should always follow descriptive prose in each
> section.","In
> >     2.6.6, 2.6.8, 5.1.6.5.6.1, 5.7.4 (no prose at all), 5.7.6.7, 5.9.5,
> and
> >     5.10.4, the ""device and driver in-memory structure layouts"" appear
> prior
> >     to any prose, which is different from the other sections. Was this a
> >     production, editorial or other type of error"
> >     > TAB-1663,47702,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Recast
> the
> >     sentences in question to remove the hyphens and elsewhere when
> improperly
> >     used in sentences.,"In 2.5 Virtqueues, the ""-"" hyphen appears to
> be a
> >     common precursor to ""i.e."" and elsewhere in the second sentence of
> that
> >     section. By count there are only seven (7) cases of - i.e.
> >     >
> >     > Given the care taken produce this work, it should not be marred by
> >     non-standard English usage such as this."
> >     > TAB-1662,47701,Virtual I/O Device (VIRTIO) Version
> 1.1,Bug,"""Device and
> >     driver in-memory structure layouts are documented using the C struct
> >     syntax.""","1.4 Structure Specifications begins with: ""Many device
> and
> >     driver in-memory structure layouts are documented using the C struct
> >     syntax.""
> >     >
> >     > Many? Not all? Many leave it doubtful that some are defined.
> >     >
> >     > Why not: ""Device and driver in-memory structure layouts are
> documented
> >     using the C struct syntax.""
> >     >
> >     > If you are missing any, add them."
> >     > TAB-1661,47700,Virtual I/O Device (VIRTIO) Version 1.1,Bug,"Define
> >     marking of non-normative text and use it, quite possibly declare all
> notes
> >     non-normative (but check all of the notes first).","I'm assuming
> that 1
> >     Introduction, your ""for example"" under 1.4 Structure
> Specifications, and
> >     at least some of the 62 Notes: are non-normative, but have not been
> so
> >     marked or described. That is you can use non-normative on a section
> heading
> >     and/or say: All notes are non-normative.
> >     >
> >     > In particular I have in mind notes like: 4.1.5.1.2.1
> >     >
> >     > ""Note: For example, a device which does not expect to send
> interrupts at
> >     a high rate might only specify 2 MSI-X vectors.""
> >     >
> >     > In terms of conformance to this specification, clearly
> non-normative
> >     language. As are many of the remaining 61 uses of note.
> >     >
> >     > ??"
> >
> >
> >
> >
> >
> >     ---------------------------------------------------------------------
> >     To unsubscribe from this mail list, you must leave the OASIS TC that
> >     generates this mail. Follow this link to all your TCs in OASIS at:
> >
> https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php
> >
> >
> >
> >
> > --
> >
> > /chet
> > ----------------
> > Chet Ensign
> > Chief Technical Community Steward
> > OASIS: Advancing open standards for the information society
> > http://www.oasis-open.org
> >
> > Primary: +1 973-996-2298
> > Mobile: +1 201-341-1393
>


-- 

/chet
----------------
Chet Ensign
Chief Technical Community Steward
OASIS: Advancing open standards for the information society
http://www.oasis-open.org

Primary: +1 973-996-2298
Mobile: +1 201-341-1393

--000000000000a4e1350582e0dff4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Will do - sorry that I can&#39;t get it to the github=C2=
=A0issues for you; JIRA though is straightforward.</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 27, 2019 at 9=
:10 AM Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Thanks! Yes please do. We mostly switched over to github issues but jira=
<br>
isn&#39;t too bad just for this.<br>
<br>
<br>
On Tue, Feb 26, 2019 at 04:29:42PM -0500, Chet Ensign wrote:<br>
&gt; Michael, if it would help, I believe I can move the issues from the TA=
B JIRA to<br>
&gt; the Virtio JIRA. Save you the work of importing them one by one.=C2=A0=
<br>
&gt; <br>
&gt; /chet<br>
&gt; <br>
&gt; On Tue, Feb 26, 2019 at 3:58 PM Michael S. Tsirkin &lt;<a href=3D"mail=
to:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Feb 21, 2019 at 05:36:51PM -0500, Patrick D=
urusau wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Greetings!<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Members of the Technical Advisory Board endeav=
or to comment on all 30 day<br>
&gt;=C2=A0 =C2=A0 =C2=A0public review drafts.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Comments on: Virtual I/O Device (VIRTIO) Versi=
on 1.1 CS01 PRD01 are<br>
&gt;=C2=A0 =C2=A0 =C2=A0attached.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; It isn&#39;t necessary to acknowledge each com=
ment separately. A single email<br>
&gt;=C2=A0 =C2=A0 =C2=A0acknowledging this email will be sufficient.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; When the TC has acted on these issues, I would=
 appreciate a pointer to<br>
&gt;=C2=A0 =C2=A0 =C2=A0the TCs resolution as the TAB is tracking the resol=
ution of comments from<br>
&gt;=C2=A0 =C2=A0 =C2=A0TAB members.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hope everyone is having a great week!<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Patrick<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks a lot for the comments!<br>
&gt;=C2=A0 =C2=A0 =C2=A0I will try to split this CSV up and create github i=
ssues<br>
&gt;=C2=A0 =C2=A0 =C2=A0so it is easier to address individual comments.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Patrick Durusau<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"mailto:patrick@durusau.net" target=
=3D"_blank">patrick@durusau.net</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Technical Advisory Board, OASIS (TAB)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Editor, OpenDocument Format TC (OASIS), Projec=
t Editor ISO/IEC 26300<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Co-Editor, ISO/IEC 13250-1, 13250-5 (Topic Map=
s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Another Word For It (blog): <a href=3D"http://=
tm.durusau.net" rel=3D"noreferrer" target=3D"_blank">http://tm.durusau.net<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Homepage: <a href=3D"http://www.durusau.net" r=
el=3D"noreferrer" target=3D"_blank">http://www.durusau.net</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Twitter: patrickDurusau<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Issue key,Issue id,Affects Version/s,Issue Typ=
e,Custom field<br>
&gt;=C2=A0 =C2=A0 =C2=A0(Proposal),Description<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1674,47718,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,Change<br>
&gt;=C2=A0 =C2=A0 =C2=A0bulleted lists into numbered lists and *always* int=
roduce a list with the<br>
&gt;=C2=A0 =C2=A0 =C2=A0number of items to follow.,&quot;Understanding and =
navigation of content is<br>
&gt;=C2=A0 =C2=A0 =C2=A0impaired by the use of bulleted lists. Compare for =
example, 2.7.21.1, being<br>
&gt;=C2=A0 =C2=A0 =C2=A0read aloud and being able to answer/find, where is =
your place in this list,<br>
&gt;=C2=A0 =C2=A0 =C2=A0as opposed to the second bulleted list in 2.7 Packe=
d Virtqueues, or either<br>
&gt;=C2=A0 =C2=A0 =C2=A0of the lists/sub-lists in 2.6.10.1.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1673,47717,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,Devise and<br>
&gt;=C2=A0 =C2=A0 =C2=A0insert uniform start and end markers for examples.,=
&quot;Most of the examples of<br>
&gt;=C2=A0 =C2=A0 =C2=A0memory structures being with struct but not all. Mo=
reover, most examples<br>
&gt;=C2=A0 =C2=A0 =C2=A0end with }; but not all, for example, under 2.7.21.=
3.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; My usual accessibility checker is offline but =
if you were reading the<br>
&gt;=C2=A0 =C2=A0 =C2=A0text aloud, if the start and end of examples is not=
 uniformly signaled to<br>
&gt;=C2=A0 =C2=A0 =C2=A0someone hearing the text, the examples would be muc=
h harder to contrast<br>
&gt;=C2=A0 =C2=A0 =C2=A0with the surrounding normative text.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; An accessibility issue?? in general but also a=
 personal one because after<br>
&gt;=C2=A0 =C2=A0 =C2=A0nearly 30 years as a diabetic my vision remains nor=
mal, but they can&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0promise how much longer that will be the case. Addi=
ng uniform start and end<br>
&gt;=C2=A0 =C2=A0 =C2=A0markers won&#39;t inconvenience sighted readers and=
 will enhance access to your<br>
&gt;=C2=A0 =C2=A0 =C2=A0work for those using assistive technologies.&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1672,47716,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,,&quot;We read in<br>
&gt;=C2=A0 =C2=A0 =C2=A07.4:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;&quot;A non-transitional implementation =
conforms to this specification if it<br>
&gt;=C2=A0 =C2=A0 =C2=A0satisfies all of the MUST or REQUIRED level require=
ments defined above. &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Is that true? ALL the &quot;&quot;MUST&quot;&q=
uot; in all previous sections? Probably not. Or<br>
&gt;=C2=A0 =C2=A0 =C2=A0maybe it is &quot;&quot;below&quot;&quot; and not &=
quot;&quot;above&quot;&quot;. (always explicitly refer to<br>
&gt;=C2=A0 =C2=A0 =C2=A0requirements sets by using a sub-section number &am=
p; name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I suggest to make &quot;&quot;transitional&quo=
t;&quot; just a variable (i.e. a parameter) in<br>
&gt;=C2=A0 =C2=A0 =C2=A0previous top-level conf clauses. (see TAB conforman=
ce guideline [http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://docs.oasis-open.org/templates/TCH=
andbook/ConformanceGuidelines.html" rel=3D"noreferrer" target=3D"_blank">do=
cs.oasis-open.org/templates/TCHandbook/ConformanceGuidelines.html</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0section 5.5)??|<a href=3D"http://docs.oasis-open.or=
g/templates/TCHandbook/" rel=3D"noreferrer" target=3D"_blank">http://docs.o=
asis-open.org/templates/TCHandbook/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0ConformanceGuidelines.html)]E.g. someone claiming c=
onformance as &quot;&quot;PCI<br>
&gt;=C2=A0 =C2=A0 =C2=A0driver&quot;&quot; should always clarify: &quot;&qu=
ot;transitional PCI driver&quot;&quot; or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;non-transitional PCI driver&quot;&quot;=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1671,47715,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,,&quot;Each<br>
&gt;=C2=A0 =C2=A0 =C2=A0conformance clause sub-section starts with somethin=
g that looks like a<br>
&gt;=C2=A0 =C2=A0 =C2=A0mandatory requirement:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; e.g.:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;&quot;A network device MUST conform to t=
he following normative statements:&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; But many of the following statements are optio=
nal (SHOULD) in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0specification body. So it is then confusing to say =
&quot;&quot;... MUST conform to a<br>
&gt;=C2=A0 =C2=A0 =C2=A0SHOULD statement....&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; That is why it is NOT recommended to use norma=
tive language like MUST<br>
&gt;=C2=A0 =C2=A0 =C2=A0(and even less SHOULD) in a conformance clause. A c=
onf clause is not there<br>
&gt;=C2=A0 =C2=A0 =C2=A0to tell you what to do or not do (MUST....), but on=
ly to state under which<br>
&gt;=C2=A0 =C2=A0 =C2=A0conditions you can claim conformance to XYZ.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; It is better to say:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;&quot;an implementation that satisfies a=
ll mandatory (MUST) requirements in<br>
&gt;=C2=A0 =C2=A0 =C2=A05.1.4.1, 5.1.6.2.... qualifies (or may claim confor=
mance) as a VIRTIO1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0network device&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Or in some conformance profiles, you can overr=
ide a SHOULD in the spec<br>
&gt;=C2=A0 =C2=A0 =C2=A0body and make it mandatory.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1670,47714,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,,&quot;Sections<br>
&gt;=C2=A0 =C2=A0 =C2=A07.2.10 and 7.2.11 are never referred to, by any con=
formance clause. Same<br>
&gt;=C2=A0 =C2=A0 =C2=A0for 7.3.10 and 7.3.11.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; That seems like an omission? They should be us=
ed in at least one<br>
&gt;=C2=A0 =C2=A0 =C2=A0conformance profile each. Or else, these sections s=
hould not be normative.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1669,47713,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,,&quot;Overall,<br>
&gt;=C2=A0 =C2=A0 =C2=A0well-formed conformance section (one of the best we=
?? TAB reviewers have<br>
&gt;=C2=A0 =C2=A0 =C2=A0seen!) The main conformance targets - drivers, devi=
ces - are well<br>
&gt;=C2=A0 =C2=A0 =C2=A0identified. The specification is clearly attributin=
g normative requirements<br>
&gt;=C2=A0 =C2=A0 =C2=A0to either driver, or device.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Some conformance aspects could still be clarif=
ied:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 * All the subsections under 7.2 or 7.3 a=
re named &quot;&quot;clauses&quot;&quot; in 7.1. So<br>
&gt;=C2=A0 =C2=A0 =C2=A0their titles should be &quot;&quot;Clause XYZ&quot;=
&quot;. Or else if we want to keep<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;CLause&quot;&quot; to only the top-leve=
l set of requirements - then define just a<br>
&gt;=C2=A0 =C2=A0 =C2=A0couple of clauses in 7.1, e.g. &quot;&quot;Conforma=
nce Clause for VIRTIO1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers&quot;&quot;. Then all thee following subsec=
tions should just be titled<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;Conformance requirements sets&quot;&quo=
t; e.g. &quot;&quot;COnformance requirements for PCI<br>
&gt;=C2=A0 =C2=A0 =C2=A0drivers&quot;&quot;), and preferably not &quot;&quo=
t;clause&quot;&quot; (keeping &quot;&quot;clause&quot;&quot; for only??<br>
&gt;=C2=A0 =C2=A0 =C2=A0the full set of requirements that a product can cla=
im for conformance).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 * In any case, it is good to associate a=
 clear name to each conformance<br>
&gt;=C2=A0 =C2=A0 =C2=A0level/profile that can be claimed. For example, &qu=
ot;&quot;PCI network driver&quot;&quot; (if<br>
&gt;=C2=A0 =C2=A0 =C2=A0satisfying 7.2 + 7.2.1 + 7.2.4. Is that a meaningfu=
l combination? irt seems<br>
&gt;=C2=A0 =C2=A0 =C2=A0so according to 7.1). So that there is no ambiguity=
 of what are the valid??<br>
&gt;=C2=A0 =C2=A0 =C2=A0conformance profiles. Some parameterization of a cl=
ause can be used: Look<br>
&gt;=C2=A0 =C2=A0 =C2=A0in TAB guideline : [<a href=3D"http://docs.oasis-op=
en.org/templates/TCHandbook/" rel=3D"noreferrer" target=3D"_blank">http://d=
ocs.oasis-open.org/templates/TCHandbook/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0ConformanceGuidelines.html] for &quot;&quot;variabl=
e conformance clauses&quot;&quot; (section<br>
&gt;=C2=A0 =C2=A0 =C2=A05.5). In other words: define the precise statement =
that someone should use<br>
&gt;=C2=A0 =C2=A0 =C2=A0when claiming a conformance profile.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ??&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1668,47707,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,&quot;The<br>
&gt;=C2=A0 =C2=A0 =C2=A0accessibility site that I commonly use, [<a href=3D=
"https://achecker.ca/checker/" rel=3D"noreferrer" target=3D"_blank">https:/=
/achecker.ca/checker/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0index.php,] is down tonight but use it to check you=
r usage for other<br>
&gt;=C2=A0 =C2=A0 =C2=A0problems.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ??&quot;,&quot;In terms of accessibility, &quo=
t;&quot;what follows,&quot;&quot; &quot;&quot;below,&quot;&quot; and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;&quot;follows&quot;&quot; all inhibit the use=
 of VIRTIO by users assisted by reading<br>
&gt;=C2=A0 =C2=A0 =C2=A0software.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Take 2.2 Feature Bits as an example:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;&quot;Feature bits are allocated as foll=
ows:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 0 to 23 Feature bits for the specific device t=
ype<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 24 to 37 Feature bits reserved for extensions =
to the queue and feature<br>
&gt;=C2=A0 =C2=A0 =C2=A0negotiation mechanisms<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 38 and above Feature bits reserved for future =
extensions.&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; A sighted reader is clued in that 3 entries fo=
llow, but reading software<br>
&gt;=C2=A0 =C2=A0 =C2=A0does not offer, in this form, the same clue.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Compare:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;&quot;Feature bits are allocated in thre=
e ways:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 1. 0 to 23 Feature bits for the specific devic=
e type<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2. 24 to 37 Feature bits reserved for extensio=
ns to the queue and feature<br>
&gt;=C2=A0 =C2=A0 =C2=A0negotiation mechanisms<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 3. 38 and above Feature bits reserved for futu=
re extensions.&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Same text but now both sighted as well as assi=
sted readers know there are<br>
&gt;=C2=A0 =C2=A0 =C2=A03 ways to allocate feature bits and each of those w=
ays is numbered and<br>
&gt;=C2=A0 =C2=A0 =C2=A0recited to the reader.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ??<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ??<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ??&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1667,47706,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,Update the<br>
&gt;=C2=A0 =C2=A0 =C2=A0IEEE 802 link and re-check with [<a href=3D"http://=
validator.w3.org/checklink" rel=3D"noreferrer" target=3D"_blank">http://val=
idator.w3.org/checklink</a>],&quot;|[IEEE<br>
&gt;=C2=A0 =C2=A0 =C2=A0802] |IEEE Standard for Local and Metropolitan Area=
 Networks: Overview and<br>
&gt;=C2=A0 =C2=A0 =C2=A0Architecture,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; [<a href=3D"http://standards.ieee.org/about/ge=
t/802/802.html" rel=3D"noreferrer" target=3D"_blank">http://standards.ieee.=
org/about/get/802/802.html</a>], IEEE|<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; reports a 404.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Did you mean: [<a href=3D"https://standards.ie=
ee.org/standard/802-2001.html%5D" rel=3D"noreferrer" target=3D"_blank">http=
s://standards.ieee.org/standard/802-2001.html]</a>?? ??&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1666,47705,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,Update the<br>
&gt;=C2=A0 =C2=A0 =C2=A0links indicated and re-check with <a href=3D"http:/=
/validator.w3.org/checklink," rel=3D"noreferrer" target=3D"_blank">http://v=
alidator.w3.org/checklink,</a>&quot;The<br>
&gt;=C2=A0 =C2=A0 =C2=A0link checker at [<a href=3D"http://validator.w3.org=
/checklink" rel=3D"noreferrer" target=3D"_blank">http://validator.w3.org/ch=
ecklink</a>] reports the following<br>
&gt;=C2=A0 =C2=A0 =C2=A0redirects:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; !<a href=3D"http://validator.w3.org/checklink/=
images/info_icons/warning.png" rel=3D"noreferrer" target=3D"_blank">http://=
validator.w3.org/checklink/images/info_icons/warning.png</a>! Line:<br>
&gt;=C2=A0 =C2=A0 =C2=A06875 [<a href=3D"http://www.pcisig.com/" rel=3D"nor=
eferrer" target=3D"_blank">http://www.pcisig.com/</a>] redirected to [<a hr=
ef=3D"http://pcisig.com/" rel=3D"noreferrer" target=3D"_blank">http://pcisi=
g.com/</a>] *Status*:<br>
&gt;=C2=A0 =C2=A0 =C2=A0301 -&gt; 200 OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This is a permanent redirect. The link should =
be updated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; !<a href=3D"http://validator.w3.org/checklink/=
images/info_icons/warning.png" rel=3D"noreferrer" target=3D"_blank">http://=
validator.w3.org/checklink/images/info_icons/warning.png</a>! Lines:<br>
&gt;=C2=A0 =C2=A0 =C2=A055, 60, 63 [<a href=3D"http://www.redhat.com/" rel=
=3D"noreferrer" target=3D"_blank">http://www.redhat.com/</a>] redirected to=
 [<a href=3D"https://www.redhat.com/" rel=3D"noreferrer" target=3D"_blank">=
https://www.redhat.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0en] *Status*: 301 -&gt; 200 OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This is a permanent redirect. The link should =
be updated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; !<a href=3D"http://validator.w3.org/checklink/=
images/info_icons/warning.png" rel=3D"noreferrer" target=3D"_blank">http://=
validator.w3.org/checklink/images/info_icons/warning.png</a>! Line:<br>
&gt;=C2=A0 =C2=A0 =C2=A021250 [<a href=3D"http://git.qemu-project.org/?p=3D=
qemu.git;a=3Dblob;f=3Ddocs/specs/" rel=3D"noreferrer" target=3D"_blank">htt=
p://git.qemu-project.org/?p=3Dqemu.git;a=3Dblob;f=3Ddocs/specs/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0standard-vga.txt;hb=3DHEAD] redirected to [<a href=
=3D"https://git.qemu.org/?p=3Dqemu.git;a" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.qemu.org/?p=3Dqemu.git;a</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0=3Dblob;f=3Ddocs/specs/standard-vga.txt;hb=3DHEAD] =
*Status*: 301 -&gt; 200 OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This is a permanent redirect. The link should =
be updated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; !<a href=3D"http://validator.w3.org/checklink/=
images/info_icons/warning.png" rel=3D"noreferrer" target=3D"_blank">http://=
validator.w3.org/checklink/images/info_icons/warning.png</a>! Line:<br>
&gt;=C2=A0 =C2=A0 =C2=A0768 [<a href=3D"http://www.pcisig.com/specification=
s/pciexpress/" rel=3D"noreferrer" target=3D"_blank">http://www.pcisig.com/s=
pecifications/pciexpress/</a>] redirected to [http:<br>
&gt;=C2=A0 =C2=A0 =C2=A0//<a href=3D"http://pcisig.com/specifications/pciex=
press/" rel=3D"noreferrer" target=3D"_blank">pcisig.com/specifications/pcie=
xpress/</a>] *Status*: 301 -&gt; 200 OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This is a permanent redirect. The link should =
be updated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; !<a href=3D"http://validator.w3.org/checklink/=
images/info_icons/warning.png" rel=3D"noreferrer" target=3D"_blank">http://=
validator.w3.org/checklink/images/info_icons/warning.png</a>! Line:=C2=A0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://www.oasis-open.org/policies-gui=
delines/tc-process" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-=
open.org/policies-guidelines/tc-process</a>] redirected to [<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.oasis-open.org/policies-guid=
elines/tc-process-2017-05-26" rel=3D"noreferrer" target=3D"_blank">https://=
www.oasis-open.org/policies-guidelines/tc-process-2017-05-26</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0*Status*: 301 -&gt; 200 OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This is a permanent redirect. The link should =
be updated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; !<a href=3D"http://validator.w3.org/checklink/=
images/info_icons/warning.png" rel=3D"noreferrer" target=3D"_blank">http://=
validator.w3.org/checklink/images/info_icons/warning.png</a>! Line:<br>
&gt;=C2=A0 =C2=A0 =C2=A0759 [<a href=3D"http://www.pcisig.com/specification=
s/conventional/" rel=3D"noreferrer" target=3D"_blank">http://www.pcisig.com=
/specifications/conventional/</a>] redirected to [<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://pcisig.com/specifications/convent=
ional/" rel=3D"noreferrer" target=3D"_blank">http://pcisig.com/specificatio=
ns/conventional/</a>] *Status*: 301 -&gt; 200 OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This is a permanent redirect. The link should =
be updated.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1665,47704,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,Number and<br>
&gt;=C2=A0 =C2=A0 =C2=A0label the in-memory structure illustrations and add=
 anchors to enable<br>
&gt;=C2=A0 =C2=A0 =C2=A0remote pointing to particular illustrations.,&quot;=
While I appreciate that the<br>
&gt;=C2=A0 =C2=A0 =C2=A0use of C struct syntax is illustrative only, the in=
-memory structures it<br>
&gt;=C2=A0 =C2=A0 =C2=A0documents are normative.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; And in a number of cases, those in-memory stru=
ctures occur in the same<br>
&gt;=C2=A0 =C2=A0 =C2=A0numbered section, making reference to any specified=
 in-memory structure<br>
&gt;=C2=A0 =C2=A0 =C2=A0uncertain.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Labeling and numbering the in-memory structure=
s (to say nothing of adding<br>
&gt;=C2=A0 =C2=A0 =C2=A0anchors for remote pointing), would greatly improve=
 the usefulness of this<br>
&gt;=C2=A0 =C2=A0 =C2=A0document.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ??&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1664,47703,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,&quot;For<br>
&gt;=C2=A0 =C2=A0 =C2=A0consistency of presentation, the &quot;&quot;device=
 and driver in-memory structure<br>
&gt;=C2=A0 =C2=A0 =C2=A0layouts&quot;&quot; should always follow descriptiv=
e prose in each section.&quot;,&quot;In<br>
&gt;=C2=A0 =C2=A0 =C2=A02.6.6, 2.6.8, 5.1.6.5.6.1, 5.7.4 (no prose at all),=
 5.7.6.7, 5.9.5, and<br>
&gt;=C2=A0 =C2=A0 =C2=A05.10.4, the &quot;&quot;device and driver in-memory=
 structure layouts&quot;&quot; appear prior<br>
&gt;=C2=A0 =C2=A0 =C2=A0to any prose, which is different from the other sec=
tions. Was this a<br>
&gt;=C2=A0 =C2=A0 =C2=A0production, editorial or other type of error&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1663,47702,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,Recast the<br>
&gt;=C2=A0 =C2=A0 =C2=A0sentences in question to remove the hyphens and els=
ewhere when improperly<br>
&gt;=C2=A0 =C2=A0 =C2=A0used in sentences.,&quot;In 2.5 Virtqueues, the &qu=
ot;&quot;-&quot;&quot; hyphen appears to be a<br>
&gt;=C2=A0 =C2=A0 =C2=A0common precursor to &quot;&quot;i.e.&quot;&quot; an=
d elsewhere in the second sentence of that<br>
&gt;=C2=A0 =C2=A0 =C2=A0section. By count there are only seven (7) cases of=
 - i.e.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Given the care taken produce this work, it sho=
uld not be marred by<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-standard English usage such as this.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1662,47701,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,&quot;&quot;&quot;Device and<br>
&gt;=C2=A0 =C2=A0 =C2=A0driver in-memory structure layouts are documented u=
sing the C struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0syntax.&quot;&quot;&quot;,&quot;1.4 Structure Speci=
fications begins with: &quot;&quot;Many device and<br>
&gt;=C2=A0 =C2=A0 =C2=A0driver in-memory structure layouts are documented u=
sing the C struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0syntax.&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Many? Not all? Many leave it doubtful that som=
e are defined.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Why not: &quot;&quot;Device and driver in-memo=
ry structure layouts are documented<br>
&gt;=C2=A0 =C2=A0 =C2=A0using the C struct syntax.&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; If you are missing any, add them.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; TAB-1661,47700,Virtual I/O Device (VIRTIO) Ver=
sion 1.1,Bug,&quot;Define<br>
&gt;=C2=A0 =C2=A0 =C2=A0marking of non-normative text and use it, quite pos=
sibly declare all notes<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-normative (but check all of the notes first).&q=
uot;,&quot;I&#39;m assuming that 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0Introduction, your &quot;&quot;for example&quot;&qu=
ot; under 1.4 Structure Specifications, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0at least some of the 62 Notes: are non-normative, b=
ut have not been so<br>
&gt;=C2=A0 =C2=A0 =C2=A0marked or described. That is you can use non-normat=
ive on a section heading<br>
&gt;=C2=A0 =C2=A0 =C2=A0and/or say: All notes are non-normative.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; In particular I have in mind notes like: 4.1.5=
.1.2.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;&quot;Note: For example, a device which =
does not expect to send interrupts at<br>
&gt;=C2=A0 =C2=A0 =C2=A0a high rate might only specify 2 MSI-X vectors.&quo=
t;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; In terms of conformance to this specification,=
 clearly non-normative<br>
&gt;=C2=A0 =C2=A0 =C2=A0language. As are many of the remaining 61 uses of n=
ote.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ??&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0---------------------------------------------------=
------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0To unsubscribe from this mail list, you must leave =
the OASIS TC that<br>
&gt;=C2=A0 =C2=A0 =C2=A0generates this mail. Follow this link to all your T=
Cs in OASIS at:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.oasis-open.org/apps/org/work=
group/portal/my_workgroups.php" rel=3D"noreferrer" target=3D"_blank">https:=
//www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php</a><br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; <br>
&gt; /chet=C2=A0<br>
&gt; ----------------<br>
&gt; Chet Ensign<br>
&gt; Chief Technical Community Steward<br>
&gt; OASIS: Advancing open standards for the information society<br>
&gt; <a href=3D"http://www.oasis-open.org" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.oasis-open.org</a><br>
&gt; <br>
&gt; Primary: +1 973-996-2298<br>
&gt; Mobile: +1 201-341-1393=C2=A0<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><br>/chet=C2=A0<br=
>----------------</div><div dir=3D"ltr">Chet Ensign<br></div><div dir=3D"lt=
r"><span style=3D"font-size:12.8px">Chief Technical Community Steward</span=
><br>OASIS: Advancing open standards for the information society<br><a href=
=3D"http://www.oasis-open.org" target=3D"_blank">http://www.oasis-open.org<=
/a><br><br>Primary: +1 973-996-2298<br>Mobile: +1 201-341-1393=C2=A0</div><=
/div></div></div></div></div></div></div></div></div>

--000000000000a4e1350582e0dff4--

