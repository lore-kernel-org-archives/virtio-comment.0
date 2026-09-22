Received: from out0-204.mail.aliyun.com (out0-204.mail.aliyun.com [140.205.0.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A142EEE85
	for <virtio-comment@lists.linux.dev>; Tue, 22 Sep 2026 03:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048926; cv=none; b=RkcBhNO1jGtVu/MBplMX5o8VHdFYd0CQWEMaXVFw2C/IHVWkvI4neBAY6iqryRx54UJH51iou+vDUD6NiXDQlAOlWUxBTtSV5zgvYtVfTwSFkJhYINGX2v4cs9lLnOoarcC3A6pmaBg9vpWdYnpVlioECaQygvCm7J6SVOd3Sic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048926; c=relaxed/simple;
	bh=ud7lsp6Es4j52HQTpBXFwtcAgTQxI9qyg4zEOhGJg0Y=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=OcjPtDgO3MJ+XRho5qamPmnFmXe7u7RMifnz2ErhrhpRfMoMvwCRw0dhHtLMywI3wIjKIzeptk/NoGvqy84eQnk+6fprvnN2aVNu+adOrln5TYTQ8JDe9WsPTewKXqQxfixNG8KCiznHpFbqR+hRPe9EYJE67VFrp3y7v3xPRY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alibaba-inc.com; spf=pass smtp.mailfrom=alibaba-inc.com; dkim=pass (1024-bit key) header.d=alibaba-inc.com header.i=@alibaba-inc.com header.b=PQ7lFRYR; arc=none smtp.client-ip=140.205.0.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alibaba-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alibaba-inc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=alibaba-inc.com header.i=@alibaba-inc.com header.b="PQ7lFRYR"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alibaba-inc.com; s=default;
	t=1790048920; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
	bh=ud7lsp6Es4j52HQTpBXFwtcAgTQxI9qyg4zEOhGJg0Y=;
	b=PQ7lFRYR9PaR9o9/jHxqlZh26Ucvi7ea9vN5q2eTUKPr1H613RXGn/eE/UL0H9Vso7U2qY2h32XW+q4wuZ6UR3/Icx1pjMHXNeLkLLc6NaPsP13XtcVcSVofMolqsEFRih7dpXcVnPbS4s0Cl/kEjODQDx5XXo6xL7RPde72jlk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=xiubei.hwl@alibaba-inc.com;NM=1;PH=DW;RN=3;SR=0;TI=W4_0.2.3_212511E3_1790048889427_o7001c574;
Received: from WS-web (xiubei.hwl@alibaba-inc.com[W4_0.2.3_212511E3_1790048889427_o7001c574] cluster:ay29) at Tue, 22 Sep 2026 11:48:32 +0800
Date: Tue, 22 Sep 2026 11:48:32 +0800
From: "=?UTF-8?B?6Z+p5Li656S8KOS/ruWMlyk=?=" <xiubei.hwl@alibaba-inc.com>
To: "virtio-comment" <virtio-comment@lists.linux.dev>
Cc: "mst" <mst@redhat.com>,
  "=?UTF-8?B?6Z+p5Li656S8KOS/ruWMlyk=?=" <xiubei.hwl@alibaba-inc.com>
Reply-To: "=?UTF-8?B?6Z+p5Li656S8KOS/ruWMlyk=?=" <xiubei.hwl@alibaba-inc.com>
Message-ID: <f392c468-a372-4cd5-96a0-ce07732ea978.xiubei.hwl@alibaba-inc.com>
Subject: =?UTF-8?B?W1JGQyBQQVRDSCB2Ml0gdmlydGlvOiBhZGQgZGV2aWNlX3JlYWR5X3N0YXR1cyB0byBjb21t?=
  =?UTF-8?B?b24gY29uZmln?=
X-Mailer: [Alimail-Mailagent][W4_0.2.3][null][Safari]
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
x-aliyun-im-through: {"version":"v1.0"}
x-aliyun-mail-creator: W4_0.2.3_null_IERTW96aWxsYS81LjAgKE1hY2ludG9zaDsgSW50ZWwgTWFjIE9TIFggMTBfMTVfNykgQXBwbGVXZWJLaXQvNjA1LjEuMTUgKEtIVE1MLCBsaWtlIEdlY2tvKSBWZXJzaW9uLzE3LjYgU2FmYXJpLzYwNS4xLjE1IERpbmdUYWxrKDguNS41LW1hY09TLWFybTY0LTEwNDkpIG53IERUV0tXZWJWaWV3IENoYW5uZWwvMTYyODQ4Nzk3MTAxMSBBcmNoaXRlY3R1cmUvYXJtNjQgMm5kVHlwZS9leGNsdXNpdmUgd2ViRHQvUEM=jE
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: multipart/alternative;
  boundary="----=ALIBOUNDARY_2348_7f49832d9700_6ab1fa90_13ad1f"

------=ALIBOUNDARY_2348_7f49832d9700_6ab1fa90_13ad1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgUGFyYXYsIE1pY2hhZWwsCkp1c3QgYSBxdWljayBub3RlIHRoYXQgdGhlIHYyIFJGQyBwYXRj
aCBoYXMgYmVlbiBwb3N0ZWQgYW5kIGFyY2hpdmVkOgpodHRwczovL2xvcmUua2VybmVsLm9yZy92
aXJ0aW8tY29tbWVudC84ZTQxOGU2OC0wOTgxLTQ3ZWEtYTEzNS0wNzIyOTZlY2Y5MTQueGl1YmVp
Lmh3bEBhbGliYWJhLWluYy5jb20vIDxodHRwczovL2xvcmUua2VybmVsLm9yZy92aXJ0aW8tY29t
bWVudC84ZTQxOGU2OC0wOTgxLTQ3ZWEtYTEzNS0wNzIyOTZlY2Y5MTQueGl1YmVpLmh3bEBhbGli
YWJhLWluYy5jb20vID4KSXQgaW1wbGVtZW50cyB0aGUgZGlyZWN0aW9uIHdlIGRpc2N1c3NlZCBp
biBBdWd1c3Q6IG5vIGZlYXR1cmUgYml0LApkZXZpY2VfcmVhZHlfc3RhdHVzL2RldmljZV9yZWFk
eV90aW1lb3V0IGFzIHVuY29uZGl0aW9uYWwgdHJhaWxpbmcgZmllbGRzCm9mIHZpcnRpb19wY2lf
Y29tbW9uX2NmZywgYW5kIHJlbW92YWwgb2YgdGhlIHBlci1xdWV1ZSBxdWV1ZV9hcm1lZCBmaWVs
ZC4KVGhlIGxvcmUgYXJjaGl2ZSBzaG93cyBpdCBhcyBhIHN0YW5kYWxvbmUgdGhyZWFkIGJlY2F1
c2UgdGhlIG9yaWdpbmFsIHNlbmQKdXNlZCBhIGRpZmZlcmVudCBzdWJqZWN0IGxpbmUuIFRoaXMg
cmVwbHkgaXMgaW50ZW5kZWQgdG8gdGllIGl0IGJhY2sgdG8gdGhlCnByZXZpb3VzIGRpc2N1c3Np
b24uCk9uZSBvcGVuIHF1ZXN0aW9uIHJlbWFpbnM6IGZvciBsZWdhY3kgZGV0ZWN0aW9uLCBpcyBy
ZWx5aW5nIG9uIHRoZSByZWdpc3RlcgpyZW1haW5pbmcgMCBmb3IgdGhlIGZ1bGwgdGltZW91dCBw
ZXJpb2Qgc3VmZmljaWVudCwgb3Igc2hvdWxkIHdlIGludHJvZHVjZQphbiBleHBsaWNpdCBzZW50
aW5lbCB2YWx1ZSAoZS5nLiBkZXZpY2VfcmVhZHlfdGltZW91dCA9IDB4RkZGRikgc28gYSBkcml2
ZXIKY2FuIGRpc3Rpbmd1aXNoICJsZWdhY3kgZGV2aWNlIiBmcm9tICJtb2Rlcm4gZGV2aWNlIHRo
YXQgaXMgc3RpbGwKaW5pdGlhbGl6aW5nIj8gSSB3b3VsZCBhcHByZWNpYXRlIHlvdXIgdGhvdWdo
dHMuClRoYW5rcywKSGFuIFdlaWxpCg==
------=ALIBOUNDARY_2348_7f49832d9700_6ab1fa90_13ad1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iX19hbGl5dW5fZW1haWxfYm9keV9ibG9jayI+PGRpdiAgc3R5bGU9ImZvbnQt
ZmFtaWx5OiBUYWhvbWEsIEFyaWFsLCBTVEhlaXRpU0MtTGlnaHQsIFNpbVN1biI+PGRpdiAgc3R5
bGU9ImNsZWFyOiBib3RoOyBmb250LWZhbWlseTogVGFob21hLCBBcmlhbCwgU1RIZWl0aVNDLUxp
Z2h0LCBTaW1TdW47Ij48YnIgPjwvZGl2PjxkaXYgIHN0eWxlPSJjbGVhcjogYm90aDsgZm9udC1m
YW1pbHk6IFRhaG9tYSwgQXJpYWwsIFNUSGVpdGlTQy1MaWdodCwgU2ltU3VuOyI+PGRpdiAgc3R5
bGU9ImNsZWFyOiBib3RoIj5IaSBQYXJhdiwgTWljaGFlbCw8L2Rpdj48ZGl2ICBzdHlsZT0iY2xl
YXI6IGJvdGgiPkp1c3QgYSBxdWljayBub3RlIHRoYXQgdGhlIHYyIFJGQyBwYXRjaCBoYXMgYmVl
biBwb3N0ZWQgYW5kIGFyY2hpdmVkOjwvZGl2PjxkaXYgIHN0eWxlPSJjbGVhcjogYm90aCI+Jm5i
c3A7IDxhICBocmVmPSJodHRwczovL2xvcmUua2VybmVsLm9yZy92aXJ0aW8tY29tbWVudC84ZTQx
OGU2OC0wOTgxLTQ3ZWEtYTEzNS0wNzIyOTZlY2Y5MTQueGl1YmVpLmh3bEBhbGliYWJhLWluYy5j
b20vIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvdmlydGlvLWNvbW1l
bnQvOGU0MThlNjgtMDk4MS00N2VhLWExMzUtMDcyMjk2ZWNmOTE0LnhpdWJlaS5od2xAYWxpYmFi
YS1pbmMuY29tLzwvYT48L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGgiPkl0IGltcGxlbWVu
dHMgdGhlIGRpcmVjdGlvbiB3ZSBkaXNjdXNzZWQgaW4gQXVndXN0OiBubyBmZWF0dXJlIGJpdCw8
L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGgiPmRldmljZV9yZWFkeV9zdGF0dXMvZGV2aWNl
X3JlYWR5X3RpbWVvdXQgYXMgdW5jb25kaXRpb25hbCB0cmFpbGluZyBmaWVsZHM8L2Rpdj48ZGl2
ICBzdHlsZT0iY2xlYXI6IGJvdGgiPm9mIHZpcnRpb19wY2lfY29tbW9uX2NmZywgYW5kIHJlbW92
YWwgb2YgdGhlIHBlci1xdWV1ZSBxdWV1ZV9hcm1lZCBmaWVsZC48L2Rpdj48ZGl2ICBzdHlsZT0i
Y2xlYXI6IGJvdGgiPlRoZSBsb3JlIGFyY2hpdmUgc2hvd3MgaXQgYXMgYSBzdGFuZGFsb25lIHRo
cmVhZCBiZWNhdXNlIHRoZSBvcmlnaW5hbCBzZW5kPC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBi
b3RoIj51c2VkIGEgZGlmZmVyZW50IHN1YmplY3QgbGluZS4gVGhpcyByZXBseSBpcyBpbnRlbmRl
ZCB0byB0aWUgaXQgYmFjayB0byB0aGU8L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGgiPnBy
ZXZpb3VzIGRpc2N1c3Npb24uPC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBib3RoIj5PbmUgb3Bl
biBxdWVzdGlvbiByZW1haW5zOiBmb3IgbGVnYWN5IGRldGVjdGlvbiwgaXMgcmVseWluZyBvbiB0
aGUgcmVnaXN0ZXI8L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGgiPnJlbWFpbmluZyAwIGZv
ciB0aGUgZnVsbCB0aW1lb3V0IHBlcmlvZCBzdWZmaWNpZW50LCBvciBzaG91bGQgd2UgaW50cm9k
dWNlPC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBib3RoIj5hbiBleHBsaWNpdCBzZW50aW5lbCB2
YWx1ZSAoZS5nLiBkZXZpY2VfcmVhZHlfdGltZW91dCA9IDB4RkZGRikgc28gYSBkcml2ZXI8L2Rp
dj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGgiPmNhbiBkaXN0aW5ndWlzaCAibGVnYWN5IGRldmlj
ZSIgZnJvbSAibW9kZXJuIGRldmljZSB0aGF0IGlzIHN0aWxsPC9kaXY+PGRpdiAgc3R5bGU9ImNs
ZWFyOiBib3RoIj5pbml0aWFsaXppbmciPyBJIHdvdWxkIGFwcHJlY2lhdGUgeW91ciB0aG91Z2h0
cy48L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGgiPjxiciA+PC9kaXY+PGRpdiAgc3R5bGU9
ImNsZWFyOiBib3RoIj5UaGFua3MsPC9kaXY+PHNwYW4gPkhhbiBXZWlsaTwvc3Bhbj48ZGl2ID48
L2Rpdj48c3BhbiAgc3R5bGU9ImZvbnQtZmFtaWx5OiBUYWhvbWEsIEFyaWFsLCBTVEhlaXRpU0Mt
TGlnaHQsIFNpbVN1biI+PGJyID48L3NwYW4+PC9kaXY+PGRpdiAgY2xhc3M9ImFsaW1haWwtc2ln
bmF0dXJlIj48L2Rpdj48L2Rpdj48L2Rpdj4=
------=ALIBOUNDARY_2348_7f49832d9700_6ab1fa90_13ad1f--

