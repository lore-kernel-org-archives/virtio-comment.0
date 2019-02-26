Return-Path: virtio-comment-return-666-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AC11E985DC8
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 Feb 2019 21:29:57 +0000 (UTC)
MIME-Version: 1.0
References: <9bdf3096-734f-a921-d570-f8dfb9300868@durusau.net> <20190226154841-mutt-send-email-mst@kernel.org>
In-Reply-To: <20190226154841-mutt-send-email-mst@kernel.org>
From: Chet Ensign <chet.ensign@oasis-open.org>
Date: Tue, 26 Feb 2019 16:29:42 -0500
Message-ID: <CAAwgnnPpbBbh3kf5d-RrJ-BmAnp5OFdZz9A6PaSzmvt33JRY_Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000046d950582d2c28d"
Subject: [virtio-comment] Re: [tab] Re: [virtio-comment] TAB comments on Virtual I/O Device
 (VIRTIO) Version 1.1
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Patrick Durusau <patrick@durusau.net>, virtio-comment@lists.oasis-open.org, OASIS TAB <tab@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000046d950582d2c28d
Content-Type: text/plain; charset="UTF-8"

Michael, if it would help, I believe I can move the issues from the TAB
JIRA to the Virtio JIRA. Save you the work of importing them one by one.

/chet

On Tue, Feb 26, 2019 at 3:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Thu, Feb 21, 2019 at 05:36:51PM -0500, Patrick Durusau wrote:
> > Greetings!
> >
> > Members of the Technical Advisory Board endeavor to comment on all 30
> day public review drafts.
> >
> > Comments on: Virtual I/O Device (VIRTIO) Version 1.1 CS01 PRD01 are
> attached.
> >
> > It isn't necessary to acknowledge each comment separately. A single
> email acknowledging this email will be sufficient.
> >
> > When the TC has acted on these issues, I would appreciate a pointer to
> the TCs resolution as the TAB is tracking the resolution of comments from
> TAB members.
> >
> > Hope everyone is having a great week!
> >
> > Patrick
>
>
> Thanks a lot for the comments!
> I will try to split this CSV up and create github issues
> so it is easier to address individual comments.
>
>
>
>
> > --
> > Patrick Durusau
> > patrick@durusau.net
> > Technical Advisory Board, OASIS (TAB)
> > Editor, OpenDocument Format TC (OASIS), Project Editor ISO/IEC 26300
> > Co-Editor, ISO/IEC 13250-1, 13250-5 (Topic Maps)
> >
> > Another Word For It (blog): http://tm.durusau.net
> > Homepage: http://www.durusau.net
> > Twitter: patrickDurusau
> >
>
> > Issue key,Issue id,Affects Version/s,Issue Type,Custom field
> (Proposal),Description
> > TAB-1674,47718,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Change
> bulleted lists into numbered lists and *always* introduce a list with the
> number of items to follow.,"Understanding and navigation of content is
> impaired by the use of bulleted lists. Compare for example, 2.7.21.1, being
> read aloud and being able to answer/find, where is your place in this list,
> as opposed to the second bulleted list in 2.7 Packed Virtqueues, or either
> of the lists/sub-lists in 2.6.10.1."
> > TAB-1673,47717,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Devise and
> insert uniform start and end markers for examples.,"Most of the examples of
> memory structures being with struct but not all. Moreover, most examples
> end with }; but not all, for example, under 2.7.21.3.
> >
> > My usual accessibility checker is offline but if you were reading the
> text aloud, if the start and end of examples is not uniformly signaled to
> someone hearing the text, the examples would be much harder to contrast
> with the surrounding normative text.
> >
> > An accessibility issue?? in general but also a personal one because
> after nearly 30 years as a diabetic my vision remains normal, but they
> can't promise how much longer that will be the case. Adding uniform start
> and end markers won't inconvenience sighted readers and will enhance access
> to your work for those using assistive technologies."
> > TAB-1672,47716,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,"We read in
> 7.4:
> >
> > ""A non-transitional implementation conforms to this specification if it
> satisfies all of the MUST or REQUIRED level requirements defined above. ""
> >
> > Is that true? ALL the ""MUST"" in all previous sections? Probably not.
> Or maybe it is ""below"" and not ""above"". (always explicitly refer to
> requirements sets by using a sub-section number & name)
> >
> > I suggest to make ""transitional"" just a variable (i.e. a parameter) in
> previous top-level conf clauses. (see TAB conformance guideline [
> http://docs.oasis-open.org/templates/TCHandbook/ConformanceGuidelines.html,
> section 5.5)??|
> http://docs.oasis-open.org/templates/TCHandbook/ConformanceGuidelines.html)]E.g.
> someone claiming conformance as ""PCI driver"" should always clarify:
> ""transitional PCI driver"" or ""non-transitional PCI driver"""
> > TAB-1671,47715,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,"Each
> conformance clause sub-section starts with something that looks like a
> mandatory requirement:
> >
> > e.g.:
> >
> > ""A network device MUST conform to the following normative statements:""
> >
> > But many of the following statements are optional (SHOULD) in the
> specification body. So it is then confusing to say ""... MUST conform to a
> SHOULD statement....""
> >
> > That is why it is NOT recommended to use normative language like MUST
> (and even less SHOULD) in a conformance clause. A conf clause is not there
> to tell you what to do or not do (MUST....), but only to state under which
> conditions you can claim conformance to XYZ.
> >
> > It is better to say:
> >
> > ""an implementation that satisfies all mandatory (MUST) requirements in
> 5.1.4.1, 5.1.6.2.... qualifies (or may claim conformance) as a VIRTIO1.1
> network device""
> >
> > Or in some conformance profiles, you can override a SHOULD in the spec
> body and make it mandatory."
> > TAB-1670,47714,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,"Sections
> 7.2.10 and 7.2.11 are never referred to, by any conformance clause. Same
> for 7.3.10 and 7.3.11.
> >
> > That seems like an omission? They should be used in at least one
> conformance profile each. Or else, these sections should not be normative."
> > TAB-1669,47713,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,"Overall,
> well-formed conformance section (one of the best we?? TAB reviewers have
> seen!) The main conformance targets - drivers, devices - are well
> identified. The specification is clearly attributing normative requirements
> to either driver, or device.
> >
> > Some conformance aspects could still be clarified:
> >  * All the subsections under 7.2 or 7.3 are named ""clauses"" in 7.1. So
> their titles should be ""Clause XYZ"". Or else if we want to keep
> ""CLause"" to only the top-level set of requirements - then define just a
> couple of clauses in 7.1, e.g. ""Conformance Clause for VIRTIO1.1
> drivers"". Then all thee following subsections should just be titled
> ""Conformance requirements sets"" e.g. ""COnformance requirements for PCI
> drivers""), and preferably not ""clause"" (keeping ""clause"" for only??
> the full set of requirements that a product can claim for conformance).
> >  * In any case, it is good to associate a clear name to each conformance
> level/profile that can be claimed. For example, ""PCI network driver"" (if
> satisfying 7.2 + 7.2.1 + 7.2.4. Is that a meaningful combination? irt seems
> so according to 7.1). So that there is no ambiguity of what are the valid??
> conformance profiles. Some parameterization of a clause can be used: Look
> in TAB guideline : [
> http://docs.oasis-open.org/templates/TCHandbook/ConformanceGuidelines.html]
> for ""variable conformance clauses"" (section 5.5). In other words: define
> the precise statement that someone should use when claiming a conformance
> profile.
> >
> > ??"
> > TAB-1668,47707,Virtual I/O Device (VIRTIO) Version 1.1,Bug,"The
> accessibility site that I commonly use, [
> https://achecker.ca/checker/index.php,] is down tonight but use it to
> check your usage for other problems.
> >
> > ??","In terms of accessibility, ""what follows,"" ""below,"" and
> ""follows"" all inhibit the use of VIRTIO by users assisted by reading
> software.
> >
> > Take 2.2 Feature Bits as an example:
> >
> > ""Feature bits are allocated as follows:
> >
> > 0 to 23 Feature bits for the specific device type
> >
> > 24 to 37 Feature bits reserved for extensions to the queue and feature
> negotiation mechanisms
> >
> > 38 and above Feature bits reserved for future extensions.""
> >
> > A sighted reader is clued in that 3 entries follow, but reading software
> does not offer, in this form, the same clue.
> >
> > Compare:
> >
> > ""Feature bits are allocated in three ways:
> >
> > 1. 0 to 23 Feature bits for the specific device type
> >
> > 2. 24 to 37 Feature bits reserved for extensions to the queue and
> feature negotiation mechanisms
> >
> > 3. 38 and above Feature bits reserved for future extensions.""
> >
> > Same text but now both sighted as well as assisted readers know there
> are 3 ways to allocate feature bits and each of those ways is numbered and
> recited to the reader.
> >
> > ??
> >
> > ??
> >
> > ??"
> > TAB-1667,47706,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Update the
> IEEE 802 link and re-check with [http://validator.w3.org/checklink],"|[IEEE
> 802] |IEEE Standard for Local and Metropolitan Area Networks: Overview and
> Architecture,
> > [http://standards.ieee.org/about/get/802/802.html], IEEE|
> >
> > reports a 404.
> >
> > Did you mean: [https://standards.ieee.org/standard/802-2001.html]?? ??"
> > TAB-1666,47705,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Update the
> links indicated and re-check with http://validator.w3.org/checklink,"The
> link checker at [http://validator.w3.org/checklink] reports the following
> redirects:
> >
> > !http://validator.w3.org/checklink/images/info_icons/warning.png! Line:
> 6875 [http://www.pcisig.com/] redirected to [http://pcisig.com/]
> *Status*: 301 -> 200 OK
> >
> > This is a permanent redirect. The link should be updated.
> >
> > !http://validator.w3.org/checklink/images/info_icons/warning.png!
> Lines: 55, 60, 63 [http://www.redhat.com/] redirected to [
> https://www.redhat.com/en] *Status*: 301 -> 200 OK
> >
> > This is a permanent redirect. The link should be updated.
> >
> > !http://validator.w3.org/checklink/images/info_icons/warning.png! Line:
> 21250 [
> http://git.qemu-project.org/?p=qemu.git;a=blob;f=docs/specs/standard-vga.txt;hb=HEAD]
> redirected to [
> https://git.qemu.org/?p=qemu.git;a=blob;f=docs/specs/standard-vga.txt;hb=HEAD]
> *Status*: 301 -> 200 OK
> >
> > This is a permanent redirect. The link should be updated.
> >
> > !http://validator.w3.org/checklink/images/info_icons/warning.png! Line:
> 768 [http://www.pcisig.com/specifications/pciexpress/] redirected to [
> http://pcisig.com/specifications/pciexpress/] *Status*: 301 -> 200 OK
> >
> > This is a permanent redirect. The link should be updated.
> >
> > !http://validator.w3.org/checklink/images/info_icons/warning.png!
> Line:  [https://www.oasis-open.org/policies-guidelines/tc-process]
> redirected to [
> https://www.oasis-open.org/policies-guidelines/tc-process-2017-05-26]
> *Status*: 301 -> 200 OK
> >
> > This is a permanent redirect. The link should be updated.
> >
> > !http://validator.w3.org/checklink/images/info_icons/warning.png! Line:
> 759 [http://www.pcisig.com/specifications/conventional/] redirected to [
> http://pcisig.com/specifications/conventional/] *Status*: 301 -> 200 OK
> >
> > This is a permanent redirect. The link should be updated."
> > TAB-1665,47704,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Number and
> label the in-memory structure illustrations and add anchors to enable
> remote pointing to particular illustrations.,"While I appreciate that the
> use of C struct syntax is illustrative only, the in-memory structures it
> documents are normative.
> >
> > And in a number of cases, those in-memory structures occur in the same
> numbered section, making reference to any specified in-memory structure
> uncertain.
> >
> > Labeling and numbering the in-memory structures (to say nothing of
> adding anchors for remote pointing), would greatly improve the usefulness
> of this document.
> >
> > ??"
> > TAB-1664,47703,Virtual I/O Device (VIRTIO) Version 1.1,Bug,"For
> consistency of presentation, the ""device and driver in-memory structure
> layouts"" should always follow descriptive prose in each section.","In
> 2.6.6, 2.6.8, 5.1.6.5.6.1, 5.7.4 (no prose at all), 5.7.6.7, 5.9.5, and
> 5.10.4, the ""device and driver in-memory structure layouts"" appear prior
> to any prose, which is different from the other sections. Was this a
> production, editorial or other type of error"
> > TAB-1663,47702,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Recast the
> sentences in question to remove the hyphens and elsewhere when improperly
> used in sentences.,"In 2.5 Virtqueues, the ""-"" hyphen appears to be a
> common precursor to ""i.e."" and elsewhere in the second sentence of that
> section. By count there are only seven (7) cases of - i.e.
> >
> > Given the care taken produce this work, it should not be marred by
> non-standard English usage such as this."
> > TAB-1662,47701,Virtual I/O Device (VIRTIO) Version 1.1,Bug,"""Device and
> driver in-memory structure layouts are documented using the C struct
> syntax.""","1.4 Structure Specifications begins with: ""Many device and
> driver in-memory structure layouts are documented using the C struct
> syntax.""
> >
> > Many? Not all? Many leave it doubtful that some are defined.
> >
> > Why not: ""Device and driver in-memory structure layouts are documented
> using the C struct syntax.""
> >
> > If you are missing any, add them."
> > TAB-1661,47700,Virtual I/O Device (VIRTIO) Version 1.1,Bug,"Define
> marking of non-normative text and use it, quite possibly declare all notes
> non-normative (but check all of the notes first).","I'm assuming that 1
> Introduction, your ""for example"" under 1.4 Structure Specifications, and
> at least some of the 62 Notes: are non-normative, but have not been so
> marked or described. That is you can use non-normative on a section heading
> and/or say: All notes are non-normative.
> >
> > In particular I have in mind notes like: 4.1.5.1.2.1
> >
> > ""Note: For example, a device which does not expect to send interrupts
> at a high rate might only specify 2 MSI-X vectors.""
> >
> > In terms of conformance to this specification, clearly non-normative
> language. As are many of the remaining 61 uses of note.
> >
> > ??"
>
>
>
>
>
> ---------------------------------------------------------------------
> To unsubscribe from this mail list, you must leave the OASIS TC that
> generates this mail. Follow this link to all your TCs in OASIS at:
> https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php
>
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

--000000000000046d950582d2c28d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Michael, if it would help, I believe I can move the issues=
 from the TAB JIRA to the Virtio JIRA. Save you the work of importing them =
one by one.=C2=A0<div><br></div><div>/chet</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 26, 2019 at 3:5=
8 PM Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Thu, Feb 21, 2019 at 05:36:51PM -0500, Patrick Durusau wrote:<br>
&gt; Greetings!<br>
&gt; <br>
&gt; Members of the Technical Advisory Board endeavor to comment on all 30 =
day public review drafts.<br>
&gt; <br>
&gt; Comments on: Virtual I/O Device (VIRTIO) Version 1.1 CS01 PRD01 are at=
tached.<br>
&gt; <br>
&gt; It isn&#39;t necessary to acknowledge each comment separately. A singl=
e email acknowledging this email will be sufficient.<br>
&gt; <br>
&gt; When the TC has acted on these issues, I would appreciate a pointer to=
 the TCs resolution as the TAB is tracking the resolution of comments from =
TAB members.<br>
&gt; <br>
&gt; Hope everyone is having a great week!<br>
&gt; <br>
&gt; Patrick<br>
<br>
<br>
Thanks a lot for the comments!<br>
I will try to split this CSV up and create github issues<br>
so it is easier to address individual comments.<br>
<br>
<br>
<br>
<br>
&gt; -- <br>
&gt; Patrick Durusau<br>
&gt; <a href=3D"mailto:patrick@durusau.net" target=3D"_blank">patrick@durus=
au.net</a><br>
&gt; Technical Advisory Board, OASIS (TAB)<br>
&gt; Editor, OpenDocument Format TC (OASIS), Project Editor ISO/IEC 26300<b=
r>
&gt; Co-Editor, ISO/IEC 13250-1, 13250-5 (Topic Maps)<br>
&gt; <br>
&gt; Another Word For It (blog): <a href=3D"http://tm.durusau.net" rel=3D"n=
oreferrer" target=3D"_blank">http://tm.durusau.net</a><br>
&gt; Homepage: <a href=3D"http://www.durusau.net" rel=3D"noreferrer" target=
=3D"_blank">http://www.durusau.net</a><br>
&gt; Twitter: patrickDurusau <br>
&gt; <br>
<br>
&gt; Issue key,Issue id,Affects Version/s,Issue Type,Custom field (Proposal=
),Description<br>
&gt; TAB-1674,47718,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Change bull=
eted lists into numbered lists and *always* introduce a list with the numbe=
r of items to follow.,&quot;Understanding and navigation of content is impa=
ired by the use of bulleted lists. Compare for example, 2.7.21.1, being rea=
d aloud and being able to answer/find, where is your place in this list, as=
 opposed to the second bulleted list in 2.7 Packed Virtqueues, or either of=
 the lists/sub-lists in 2.6.10.1.&quot;<br>
&gt; TAB-1673,47717,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Devise and =
insert uniform start and end markers for examples.,&quot;Most of the exampl=
es of memory structures being with struct but not all. Moreover, most examp=
les end with }; but not all, for example, under 2.7.21.3.<br>
&gt; <br>
&gt; My usual accessibility checker is offline but if you were reading the =
text aloud, if the start and end of examples is not uniformly signaled to s=
omeone hearing the text, the examples would be much harder to contrast with=
 the surrounding normative text.<br>
&gt; <br>
&gt; An accessibility issue?? in general but also a personal one because af=
ter nearly 30 years as a diabetic my vision remains normal, but they can&#3=
9;t promise how much longer that will be the case. Adding uniform start and=
 end markers won&#39;t inconvenience sighted readers and will enhance acces=
s to your work for those using assistive technologies.&quot;<br>
&gt; TAB-1672,47716,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,&quot;We r=
ead in 7.4:<br>
&gt; <br>
&gt; &quot;&quot;A non-transitional implementation conforms to this specifi=
cation if it satisfies all of the MUST or REQUIRED level requirements defin=
ed above. &quot;&quot;<br>
&gt; <br>
&gt; Is that true? ALL the &quot;&quot;MUST&quot;&quot; in all previous sec=
tions? Probably not. Or maybe it is &quot;&quot;below&quot;&quot; and not &=
quot;&quot;above&quot;&quot;. (always explicitly refer to requirements sets=
 by using a sub-section number &amp; name)<br>
&gt; <br>
&gt; I suggest to make &quot;&quot;transitional&quot;&quot; just a variable=
 (i.e. a parameter) in previous top-level conf clauses. (see TAB conformanc=
e guideline [<a href=3D"http://docs.oasis-open.org/templates/TCHandbook/Con=
formanceGuidelines.html" rel=3D"noreferrer" target=3D"_blank">http://docs.o=
asis-open.org/templates/TCHandbook/ConformanceGuidelines.html</a>, section =
5.5)??|<a href=3D"http://docs.oasis-open.org/templates/TCHandbook/Conforman=
ceGuidelines.html)%5DE.g" rel=3D"noreferrer" target=3D"_blank">http://docs.=
oasis-open.org/templates/TCHandbook/ConformanceGuidelines.html)]E.g</a>. so=
meone claiming conformance as &quot;&quot;PCI driver&quot;&quot; should alw=
ays clarify: &quot;&quot;transitional PCI driver&quot;&quot; or &quot;&quot=
;non-transitional PCI driver&quot;&quot;&quot;<br>
&gt; TAB-1671,47715,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,&quot;Each=
 conformance clause sub-section starts with something that looks like a man=
datory requirement:<br>
&gt; <br>
&gt; e.g.:<br>
&gt; <br>
&gt; &quot;&quot;A network device MUST conform to the following normative s=
tatements:&quot;&quot;<br>
&gt; <br>
&gt; But many of the following statements are optional (SHOULD) in the spec=
ification body. So it is then confusing to say &quot;&quot;... MUST conform=
 to a SHOULD statement....&quot;&quot;<br>
&gt; <br>
&gt; That is why it is NOT recommended to use normative language like MUST =
(and even less SHOULD) in a conformance clause. A conf clause is not there =
to tell you what to do or not do (MUST....), but only to state under which =
conditions you can claim conformance to XYZ.<br>
&gt; <br>
&gt; It is better to say:<br>
&gt; <br>
&gt; &quot;&quot;an implementation that satisfies all mandatory (MUST) requ=
irements in 5.1.4.1, 5.1.6.2.... qualifies (or may claim conformance) as a =
VIRTIO1.1 network device&quot;&quot;<br>
&gt; <br>
&gt; Or in some conformance profiles, you can override a SHOULD in the spec=
 body and make it mandatory.&quot;<br>
&gt; TAB-1670,47714,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,&quot;Sect=
ions 7.2.10 and 7.2.11 are never referred to, by any conformance clause. Sa=
me for 7.3.10 and 7.3.11.<br>
&gt; <br>
&gt; That seems like an omission? They should be used in at least one confo=
rmance profile each. Or else, these sections should not be normative.&quot;=
<br>
&gt; TAB-1669,47713,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,&quot;Over=
all, well-formed conformance section (one of the best we?? TAB reviewers ha=
ve seen!) The main conformance targets - drivers, devices - are well identi=
fied. The specification is clearly attributing normative requirements to ei=
ther driver, or device.<br>
&gt; <br>
&gt; Some conformance aspects could still be clarified:<br>
&gt;=C2=A0 * All the subsections under 7.2 or 7.3 are named &quot;&quot;cla=
uses&quot;&quot; in 7.1. So their titles should be &quot;&quot;Clause XYZ&q=
uot;&quot;. Or else if we want to keep &quot;&quot;CLause&quot;&quot; to on=
ly the top-level set of requirements - then define just a couple of clauses=
 in 7.1, e.g. &quot;&quot;Conformance Clause for VIRTIO1.1 drivers&quot;&qu=
ot;. Then all thee following subsections should just be titled &quot;&quot;=
Conformance requirements sets&quot;&quot; e.g. &quot;&quot;COnformance requ=
irements for PCI drivers&quot;&quot;), and preferably not &quot;&quot;claus=
e&quot;&quot; (keeping &quot;&quot;clause&quot;&quot; for only?? the full s=
et of requirements that a product can claim for conformance).<br>
&gt;=C2=A0 * In any case, it is good to associate a clear name to each conf=
ormance level/profile that can be claimed. For example, &quot;&quot;PCI net=
work driver&quot;&quot; (if satisfying 7.2 + 7.2.1 + 7.2.4. Is that a meani=
ngful combination? irt seems so according to 7.1). So that there is no ambi=
guity of what are the valid?? conformance profiles. Some parameterization o=
f a clause can be used: Look in TAB guideline : [<a href=3D"http://docs.oas=
is-open.org/templates/TCHandbook/ConformanceGuidelines.html" rel=3D"norefer=
rer" target=3D"_blank">http://docs.oasis-open.org/templates/TCHandbook/Conf=
ormanceGuidelines.html</a>] for &quot;&quot;variable conformance clauses&qu=
ot;&quot; (section 5.5). In other words: define the precise statement that =
someone should use when claiming a conformance profile.<br>
&gt; <br>
&gt; ??&quot;<br>
&gt; TAB-1668,47707,Virtual I/O Device (VIRTIO) Version 1.1,Bug,&quot;The a=
ccessibility site that I commonly use, [<a href=3D"https://achecker.ca/chec=
ker/index.php," rel=3D"noreferrer" target=3D"_blank">https://achecker.ca/ch=
ecker/index.php,</a>] is down tonight but use it to check your usage for ot=
her problems. <br>
&gt; <br>
&gt; ??&quot;,&quot;In terms of accessibility, &quot;&quot;what follows,&qu=
ot;&quot; &quot;&quot;below,&quot;&quot; and &quot;&quot;follows&quot;&quot=
; all inhibit the use of VIRTIO by users assisted by reading software.<br>
&gt; <br>
&gt; Take 2.2 Feature Bits as an example:<br>
&gt; <br>
&gt; &quot;&quot;Feature bits are allocated as follows:<br>
&gt; <br>
&gt; 0 to 23 Feature bits for the specific device type<br>
&gt; <br>
&gt; 24 to 37 Feature bits reserved for extensions to the queue and feature=
 negotiation mechanisms<br>
&gt; <br>
&gt; 38 and above Feature bits reserved for future extensions.&quot;&quot;<=
br>
&gt; <br>
&gt; A sighted reader is clued in that 3 entries follow, but reading softwa=
re does not offer, in this form, the same clue.<br>
&gt; <br>
&gt; Compare:<br>
&gt; <br>
&gt; &quot;&quot;Feature bits are allocated in three ways:<br>
&gt; <br>
&gt; 1. 0 to 23 Feature bits for the specific device type<br>
&gt; <br>
&gt; 2. 24 to 37 Feature bits reserved for extensions to the queue and feat=
ure negotiation mechanisms<br>
&gt; <br>
&gt; 3. 38 and above Feature bits reserved for future extensions.&quot;&quo=
t;<br>
&gt; <br>
&gt; Same text but now both sighted as well as assisted readers know there =
are 3 ways to allocate feature bits and each of those ways is numbered and =
recited to the reader.<br>
&gt; <br>
&gt; ??<br>
&gt; <br>
&gt; ??<br>
&gt; <br>
&gt; ??&quot;<br>
&gt; TAB-1667,47706,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Update the =
IEEE 802 link and re-check with [<a href=3D"http://validator.w3.org/checkli=
nk" rel=3D"noreferrer" target=3D"_blank">http://validator.w3.org/checklink<=
/a>],&quot;|[IEEE 802] |IEEE Standard for Local and Metropolitan Area Netwo=
rks: Overview and Architecture, <br>
&gt; [<a href=3D"http://standards.ieee.org/about/get/802/802.html" rel=3D"n=
oreferrer" target=3D"_blank">http://standards.ieee.org/about/get/802/802.ht=
ml</a>], IEEE|<br>
&gt; <br>
&gt; reports a 404.<br>
&gt; <br>
&gt; Did you mean: [<a href=3D"https://standards.ieee.org/standard/802-2001=
.html%5D" rel=3D"noreferrer" target=3D"_blank">https://standards.ieee.org/s=
tandard/802-2001.html]</a>?? ??&quot;<br>
&gt; TAB-1666,47705,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Update the =
links indicated and re-check with <a href=3D"http://validator.w3.org/checkl=
ink," rel=3D"noreferrer" target=3D"_blank">http://validator.w3.org/checklin=
k,</a>&quot;The link checker at [<a href=3D"http://validator.w3.org/checkli=
nk" rel=3D"noreferrer" target=3D"_blank">http://validator.w3.org/checklink<=
/a>] reports the following redirects:<br>
&gt; <br>
&gt; !<a href=3D"http://validator.w3.org/checklink/images/info_icons/warnin=
g.png" rel=3D"noreferrer" target=3D"_blank">http://validator.w3.org/checkli=
nk/images/info_icons/warning.png</a>! Line: 6875 [<a href=3D"http://www.pci=
sig.com/" rel=3D"noreferrer" target=3D"_blank">http://www.pcisig.com/</a>] =
redirected to [<a href=3D"http://pcisig.com/" rel=3D"noreferrer" target=3D"=
_blank">http://pcisig.com/</a>] *Status*: 301 -&gt; 200 OK<br>
&gt; <br>
&gt; This is a permanent redirect. The link should be updated.<br>
&gt; <br>
&gt; !<a href=3D"http://validator.w3.org/checklink/images/info_icons/warnin=
g.png" rel=3D"noreferrer" target=3D"_blank">http://validator.w3.org/checkli=
nk/images/info_icons/warning.png</a>! Lines: 55, 60, 63 [<a href=3D"http://=
www.redhat.com/" rel=3D"noreferrer" target=3D"_blank">http://www.redhat.com=
/</a>] redirected to [<a href=3D"https://www.redhat.com/en" rel=3D"noreferr=
er" target=3D"_blank">https://www.redhat.com/en</a>] *Status*: 301 -&gt; 20=
0 OK<br>
&gt; <br>
&gt; This is a permanent redirect. The link should be updated.<br>
&gt; <br>
&gt; !<a href=3D"http://validator.w3.org/checklink/images/info_icons/warnin=
g.png" rel=3D"noreferrer" target=3D"_blank">http://validator.w3.org/checkli=
nk/images/info_icons/warning.png</a>! Line: 21250 [<a href=3D"http://git.qe=
mu-project.org/?p=3Dqemu.git;a=3Dblob;f=3Ddocs/specs/standard-vga.txt;hb=3D=
HEAD" rel=3D"noreferrer" target=3D"_blank">http://git.qemu-project.org/?p=
=3Dqemu.git;a=3Dblob;f=3Ddocs/specs/standard-vga.txt;hb=3DHEAD</a>] redirec=
ted to [<a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Ddocs/spe=
cs/standard-vga.txt;hb=3DHEAD" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Ddocs/specs/standard-vga.txt;hb=3DH=
EAD</a>] *Status*: 301 -&gt; 200 OK<br>
&gt; <br>
&gt; This is a permanent redirect. The link should be updated.<br>
&gt; <br>
&gt; !<a href=3D"http://validator.w3.org/checklink/images/info_icons/warnin=
g.png" rel=3D"noreferrer" target=3D"_blank">http://validator.w3.org/checkli=
nk/images/info_icons/warning.png</a>! Line: 768 [<a href=3D"http://www.pcis=
ig.com/specifications/pciexpress/" rel=3D"noreferrer" target=3D"_blank">htt=
p://www.pcisig.com/specifications/pciexpress/</a>] redirected to [<a href=
=3D"http://pcisig.com/specifications/pciexpress/" rel=3D"noreferrer" target=
=3D"_blank">http://pcisig.com/specifications/pciexpress/</a>] *Status*: 301=
 -&gt; 200 OK<br>
&gt; <br>
&gt; This is a permanent redirect. The link should be updated.<br>
&gt; <br>
&gt; !<a href=3D"http://validator.w3.org/checklink/images/info_icons/warnin=
g.png" rel=3D"noreferrer" target=3D"_blank">http://validator.w3.org/checkli=
nk/images/info_icons/warning.png</a>! Line:=C2=A0 [<a href=3D"https://www.o=
asis-open.org/policies-guidelines/tc-process" rel=3D"noreferrer" target=3D"=
_blank">https://www.oasis-open.org/policies-guidelines/tc-process</a>] redi=
rected to [<a href=3D"https://www.oasis-open.org/policies-guidelines/tc-pro=
cess-2017-05-26" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-ope=
n.org/policies-guidelines/tc-process-2017-05-26</a>] *Status*: 301 -&gt; 20=
0 OK<br>
&gt; <br>
&gt; This is a permanent redirect. The link should be updated.<br>
&gt; <br>
&gt; !<a href=3D"http://validator.w3.org/checklink/images/info_icons/warnin=
g.png" rel=3D"noreferrer" target=3D"_blank">http://validator.w3.org/checkli=
nk/images/info_icons/warning.png</a>! Line: 759 [<a href=3D"http://www.pcis=
ig.com/specifications/conventional/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://www.pcisig.com/specifications/conventional/</a>] redirected to [<a hr=
ef=3D"http://pcisig.com/specifications/conventional/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://pcisig.com/specifications/conventional/</a>] *Status=
*: 301 -&gt; 200 OK<br>
&gt; <br>
&gt; This is a permanent redirect. The link should be updated.&quot;<br>
&gt; TAB-1665,47704,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Number and =
label the in-memory structure illustrations and add anchors to enable remot=
e pointing to particular illustrations.,&quot;While I appreciate that the u=
se of C struct syntax is illustrative only, the in-memory structures it doc=
uments are normative.<br>
&gt; <br>
&gt; And in a number of cases, those in-memory structures occur in the same=
 numbered section, making reference to any specified in-memory structure un=
certain.<br>
&gt; <br>
&gt; Labeling and numbering the in-memory structures (to say nothing of add=
ing anchors for remote pointing), would greatly improve the usefulness of t=
his document.<br>
&gt; <br>
&gt; ??&quot;<br>
&gt; TAB-1664,47703,Virtual I/O Device (VIRTIO) Version 1.1,Bug,&quot;For c=
onsistency of presentation, the &quot;&quot;device and driver in-memory str=
ucture layouts&quot;&quot; should always follow descriptive prose in each s=
ection.&quot;,&quot;In 2.6.6, 2.6.8, 5.1.6.5.6.1, 5.7.4 (no prose at all), =
5.7.6.7, 5.9.5, and 5.10.4, the &quot;&quot;device and driver in-memory str=
ucture layouts&quot;&quot; appear prior to any prose, which is different fr=
om the other sections. Was this a production, editorial or other type of er=
ror&quot;<br>
&gt; TAB-1663,47702,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Recast the =
sentences in question to remove the hyphens and elsewhere when improperly u=
sed in sentences.,&quot;In 2.5 Virtqueues, the &quot;&quot;-&quot;&quot; hy=
phen appears to be a common precursor to &quot;&quot;i.e.&quot;&quot; and e=
lsewhere in the second sentence of that section. By count there are only se=
ven (7) cases of - i.e.<br>
&gt; <br>
&gt; Given the care taken produce this work, it should not be marred by non=
-standard English usage such as this.&quot;<br>
&gt; TAB-1662,47701,Virtual I/O Device (VIRTIO) Version 1.1,Bug,&quot;&quot=
;&quot;Device and driver in-memory structure layouts are documented using t=
he C struct syntax.&quot;&quot;&quot;,&quot;1.4 Structure Specifications be=
gins with: &quot;&quot;Many device and driver in-memory structure layouts a=
re documented using the C struct syntax.&quot;&quot;<br>
&gt; <br>
&gt; Many? Not all? Many leave it doubtful that some are defined.<br>
&gt; <br>
&gt; Why not: &quot;&quot;Device and driver in-memory structure layouts are=
 documented using the C struct syntax.&quot;&quot;<br>
&gt; <br>
&gt; If you are missing any, add them.&quot;<br>
&gt; TAB-1661,47700,Virtual I/O Device (VIRTIO) Version 1.1,Bug,&quot;Defin=
e marking of non-normative text and use it, quite possibly declare all note=
s non-normative (but check all of the notes first).&quot;,&quot;I&#39;m ass=
uming that 1 Introduction, your &quot;&quot;for example&quot;&quot; under 1=
.4 Structure Specifications, and at least some of the 62 Notes: are non-nor=
mative, but have not been so marked or described. That is you can use non-n=
ormative on a section heading and/or say: All notes are non-normative.<br>
&gt; <br>
&gt; In particular I have in mind notes like: 4.1.5.1.2.1<br>
&gt; <br>
&gt; &quot;&quot;Note: For example, a device which does not expect to send =
interrupts at a high rate might only specify 2 MSI-X vectors.&quot;&quot;<b=
r>
&gt; <br>
&gt; In terms of conformance to this specification, clearly non-normative l=
anguage. As are many of the remaining 61 uses of note.<br>
&gt; <br>
&gt; ??&quot;<br>
<br>
<br>
<br>
<br>
<br>
---------------------------------------------------------------------<br>
To unsubscribe from this mail list, you must leave the OASIS TC that <br>
generates this mail. Follow this link to all your TCs in OASIS at:<br>
<a href=3D"https://www.oasis-open.org/apps/org/workgroup/portal/my_workgrou=
ps.php" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/app=
s/org/workgroup/portal/my_workgroups.php</a> <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><br>/chet=C2=A0<br=
>----------------</div><div dir=3D"ltr">Chet Ensign<br></div><div dir=3D"lt=
r"><span style=3D"font-size:12.8px">Chief Technical Community Steward</span=
><br>OASIS: Advancing open standards for the information society<br><a href=
=3D"http://www.oasis-open.org" target=3D"_blank">http://www.oasis-open.org<=
/a><br><br>Primary: +1 973-996-2298<br>Mobile: +1 201-341-1393=C2=A0</div><=
/div></div></div></div></div></div></div></div></div>

--000000000000046d950582d2c28d--
