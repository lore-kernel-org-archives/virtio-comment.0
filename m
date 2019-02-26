Return-Path: virtio-comment-return-665-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ADBD7985DC6
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 Feb 2019 20:58:12 +0000 (UTC)
Date: Tue, 26 Feb 2019 15:58:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190226154841-mutt-send-email-mst@kernel.org>
References: <9bdf3096-734f-a921-d570-f8dfb9300868@durusau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bdf3096-734f-a921-d570-f8dfb9300868@durusau.net>
Subject: Re: [virtio-comment] TAB comments on Virtual I/O Device (VIRTIO)
 Version 1.1
To: Patrick Durusau <patrick@durusau.net>
Cc: virtio-comment@lists.oasis-open.org, OASIS TAB <tab@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Feb 21, 2019 at 05:36:51PM -0500, Patrick Durusau wrote:
> Greetings!
> 
> Members of the Technical Advisory Board endeavor to comment on all 30 day public review drafts.
> 
> Comments on: Virtual I/O Device (VIRTIO) Version 1.1 CS01 PRD01 are attached.
> 
> It isn't necessary to acknowledge each comment separately. A single email acknowledging this email will be sufficient.
> 
> When the TC has acted on these issues, I would appreciate a pointer to the TCs resolution as the TAB is tracking the resolution of comments from TAB members.
> 
> Hope everyone is having a great week!
> 
> Patrick


Thanks a lot for the comments!
I will try to split this CSV up and create github issues
so it is easier to address individual comments.




> -- 
> Patrick Durusau
> patrick@durusau.net
> Technical Advisory Board, OASIS (TAB)
> Editor, OpenDocument Format TC (OASIS), Project Editor ISO/IEC 26300
> Co-Editor, ISO/IEC 13250-1, 13250-5 (Topic Maps)
> 
> Another Word For It (blog): http://tm.durusau.net
> Homepage: http://www.durusau.net
> Twitter: patrickDurusau 
> 

> Issue key,Issue id,Affects Version/s,Issue Type,Custom field (Proposal),Description
> TAB-1674,47718,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Change bulleted lists into numbered lists and *always* introduce a list with the number of items to follow.,"Understanding and navigation of content is impaired by the use of bulleted lists. Compare for example, 2.7.21.1, being read aloud and being able to answer/find, where is your place in this list, as opposed to the second bulleted list in 2.7 Packed Virtqueues, or either of the lists/sub-lists in 2.6.10.1."
> TAB-1673,47717,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Devise and insert uniform start and end markers for examples.,"Most of the examples of memory structures being with struct but not all. Moreover, most examples end with }; but not all, for example, under 2.7.21.3.
> 
> My usual accessibility checker is offline but if you were reading the text aloud, if the start and end of examples is not uniformly signaled to someone hearing the text, the examples would be much harder to contrast with the surrounding normative text.
> 
> An accessibility issue?? in general but also a personal one because after nearly 30 years as a diabetic my vision remains normal, but they can't promise how much longer that will be the case. Adding uniform start and end markers won't inconvenience sighted readers and will enhance access to your work for those using assistive technologies."
> TAB-1672,47716,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,"We read in 7.4:
> 
> ""A non-transitional implementation conforms to this specification if it satisfies all of the MUST or REQUIRED level requirements defined above. ""
> 
> Is that true? ALL the ""MUST"" in all previous sections? Probably not. Or maybe it is ""below"" and not ""above"". (always explicitly refer to requirements sets by using a sub-section number & name)
> 
> I suggest to make ""transitional"" just a variable (i.e. a parameter) in previous top-level conf clauses. (see TAB conformance guideline [http://docs.oasis-open.org/templates/TCHandbook/ConformanceGuidelines.html, section 5.5)??|http://docs.oasis-open.org/templates/TCHandbook/ConformanceGuidelines.html)]E.g. someone claiming conformance as ""PCI driver"" should always clarify: ""transitional PCI driver"" or ""non-transitional PCI driver"""
> TAB-1671,47715,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,"Each conformance clause sub-section starts with something that looks like a mandatory requirement:
> 
> e.g.:
> 
> ""A network device MUST conform to the following normative statements:""
> 
> But many of the following statements are optional (SHOULD) in the specification body. So it is then confusing to say ""... MUST conform to a SHOULD statement....""
> 
> That is why it is NOT recommended to use normative language like MUST (and even less SHOULD) in a conformance clause. A conf clause is not there to tell you what to do or not do (MUST....), but only to state under which conditions you can claim conformance to XYZ.
> 
> It is better to say:
> 
> ""an implementation that satisfies all mandatory (MUST) requirements in 5.1.4.1, 5.1.6.2.... qualifies (or may claim conformance) as a VIRTIO1.1 network device""
> 
> Or in some conformance profiles, you can override a SHOULD in the spec body and make it mandatory."
> TAB-1670,47714,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,"Sections 7.2.10 and 7.2.11 are never referred to, by any conformance clause. Same for 7.3.10 and 7.3.11.
> 
> That seems like an omission? They should be used in at least one conformance profile each. Or else, these sections should not be normative."
> TAB-1669,47713,Virtual I/O Device (VIRTIO) Version 1.1,Bug,,"Overall, well-formed conformance section (one of the best we?? TAB reviewers have seen!) The main conformance targets - drivers, devices - are well identified. The specification is clearly attributing normative requirements to either driver, or device.
> 
> Some conformance aspects could still be clarified:
>  * All the subsections under 7.2 or 7.3 are named ""clauses"" in 7.1. So their titles should be ""Clause XYZ"". Or else if we want to keep ""CLause"" to only the top-level set of requirements - then define just a couple of clauses in 7.1, e.g. ""Conformance Clause for VIRTIO1.1 drivers"". Then all thee following subsections should just be titled ""Conformance requirements sets"" e.g. ""COnformance requirements for PCI drivers""), and preferably not ""clause"" (keeping ""clause"" for only?? the full set of requirements that a product can claim for conformance).
>  * In any case, it is good to associate a clear name to each conformance level/profile that can be claimed. For example, ""PCI network driver"" (if satisfying 7.2 + 7.2.1 + 7.2.4. Is that a meaningful combination? irt seems so according to 7.1). So that there is no ambiguity of what are the valid?? conformance profiles. Some parameterization of a clause can be used: Look in TAB guideline : [http://docs.oasis-open.org/templates/TCHandbook/ConformanceGuidelines.html] for ""variable conformance clauses"" (section 5.5). In other words: define the precise statement that someone should use when claiming a conformance profile.
> 
> ??"
> TAB-1668,47707,Virtual I/O Device (VIRTIO) Version 1.1,Bug,"The accessibility site that I commonly use, [https://achecker.ca/checker/index.php,] is down tonight but use it to check your usage for other problems. 
> 
> ??","In terms of accessibility, ""what follows,"" ""below,"" and ""follows"" all inhibit the use of VIRTIO by users assisted by reading software.
> 
> Take 2.2 Feature Bits as an example:
> 
> ""Feature bits are allocated as follows:
> 
> 0 to 23 Feature bits for the specific device type
> 
> 24 to 37 Feature bits reserved for extensions to the queue and feature negotiation mechanisms
> 
> 38 and above Feature bits reserved for future extensions.""
> 
> A sighted reader is clued in that 3 entries follow, but reading software does not offer, in this form, the same clue.
> 
> Compare:
> 
> ""Feature bits are allocated in three ways:
> 
> 1. 0 to 23 Feature bits for the specific device type
> 
> 2. 24 to 37 Feature bits reserved for extensions to the queue and feature negotiation mechanisms
> 
> 3. 38 and above Feature bits reserved for future extensions.""
> 
> Same text but now both sighted as well as assisted readers know there are 3 ways to allocate feature bits and each of those ways is numbered and recited to the reader.
> 
> ??
> 
> ??
> 
> ??"
> TAB-1667,47706,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Update the IEEE 802 link and re-check with [http://validator.w3.org/checklink],"|[IEEE 802] |IEEE Standard for Local and Metropolitan Area Networks: Overview and Architecture, 
> [http://standards.ieee.org/about/get/802/802.html], IEEE|
> 
> reports a 404.
> 
> Did you mean: [https://standards.ieee.org/standard/802-2001.html]?? ??"
> TAB-1666,47705,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Update the links indicated and re-check with http://validator.w3.org/checklink,"The link checker at [http://validator.w3.org/checklink] reports the following redirects:
> 
> !http://validator.w3.org/checklink/images/info_icons/warning.png! Line: 6875 [http://www.pcisig.com/] redirected to [http://pcisig.com/] *Status*: 301 -> 200 OK
> 
> This is a permanent redirect. The link should be updated.
> 
> !http://validator.w3.org/checklink/images/info_icons/warning.png! Lines: 55, 60, 63 [http://www.redhat.com/] redirected to [https://www.redhat.com/en] *Status*: 301 -> 200 OK
> 
> This is a permanent redirect. The link should be updated.
> 
> !http://validator.w3.org/checklink/images/info_icons/warning.png! Line: 21250 [http://git.qemu-project.org/?p=qemu.git;a=blob;f=docs/specs/standard-vga.txt;hb=HEAD] redirected to [https://git.qemu.org/?p=qemu.git;a=blob;f=docs/specs/standard-vga.txt;hb=HEAD] *Status*: 301 -> 200 OK
> 
> This is a permanent redirect. The link should be updated.
> 
> !http://validator.w3.org/checklink/images/info_icons/warning.png! Line: 768 [http://www.pcisig.com/specifications/pciexpress/] redirected to [http://pcisig.com/specifications/pciexpress/] *Status*: 301 -> 200 OK
> 
> This is a permanent redirect. The link should be updated.
> 
> !http://validator.w3.org/checklink/images/info_icons/warning.png! Line:  [https://www.oasis-open.org/policies-guidelines/tc-process] redirected to [https://www.oasis-open.org/policies-guidelines/tc-process-2017-05-26] *Status*: 301 -> 200 OK
> 
> This is a permanent redirect. The link should be updated.
> 
> !http://validator.w3.org/checklink/images/info_icons/warning.png! Line: 759 [http://www.pcisig.com/specifications/conventional/] redirected to [http://pcisig.com/specifications/conventional/] *Status*: 301 -> 200 OK
> 
> This is a permanent redirect. The link should be updated."
> TAB-1665,47704,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Number and label the in-memory structure illustrations and add anchors to enable remote pointing to particular illustrations.,"While I appreciate that the use of C struct syntax is illustrative only, the in-memory structures it documents are normative.
> 
> And in a number of cases, those in-memory structures occur in the same numbered section, making reference to any specified in-memory structure uncertain.
> 
> Labeling and numbering the in-memory structures (to say nothing of adding anchors for remote pointing), would greatly improve the usefulness of this document.
> 
> ??"
> TAB-1664,47703,Virtual I/O Device (VIRTIO) Version 1.1,Bug,"For consistency of presentation, the ""device and driver in-memory structure layouts"" should always follow descriptive prose in each section.","In 2.6.6, 2.6.8, 5.1.6.5.6.1, 5.7.4 (no prose at all), 5.7.6.7, 5.9.5, and 5.10.4, the ""device and driver in-memory structure layouts"" appear prior to any prose, which is different from the other sections. Was this a production, editorial or other type of error"
> TAB-1663,47702,Virtual I/O Device (VIRTIO) Version 1.1,Bug,Recast the sentences in question to remove the hyphens and elsewhere when improperly used in sentences.,"In 2.5 Virtqueues, the ""-"" hyphen appears to be a common precursor to ""i.e."" and elsewhere in the second sentence of that section. By count there are only seven (7) cases of - i.e.
> 
> Given the care taken produce this work, it should not be marred by non-standard English usage such as this."
> TAB-1662,47701,Virtual I/O Device (VIRTIO) Version 1.1,Bug,"""Device and driver in-memory structure layouts are documented using the C struct syntax.""","1.4 Structure Specifications begins with: ""Many device and driver in-memory structure layouts are documented using the C struct syntax.""
> 
> Many? Not all? Many leave it doubtful that some are defined.
> 
> Why not: ""Device and driver in-memory structure layouts are documented using the C struct syntax.""
> 
> If you are missing any, add them."
> TAB-1661,47700,Virtual I/O Device (VIRTIO) Version 1.1,Bug,"Define marking of non-normative text and use it, quite possibly declare all notes non-normative (but check all of the notes first).","I'm assuming that 1 Introduction, your ""for example"" under 1.4 Structure Specifications, and at least some of the 62 Notes: are non-normative, but have not been so marked or described. That is you can use non-normative on a section heading and/or say: All notes are non-normative.
> 
> In particular I have in mind notes like: 4.1.5.1.2.1
> 
> ""Note: For example, a device which does not expect to send interrupts at a high rate might only specify 2 MSI-X vectors.""
> 
> In terms of conformance to this specification, clearly non-normative language. As are many of the remaining 61 uses of note.
> 
> ??"





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

