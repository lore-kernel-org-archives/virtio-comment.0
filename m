Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2075.outbound.protection.outlook.com [40.107.102.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1512F3E
	for <virtio-comment@lists.linux.dev>; Sat,  7 Jun 2025 02:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749262277; cv=fail; b=k++m8ksqOawMx7/DSM7BEjjwMHTLTu9i7FtaDqLgo8sZ2MscsYW47eEZJ/pduF0XA/Qk+CBXjzrYwwre7iD3q2tk0IGOBvAR+tyGaSBF4Uk0aBIr6XjeUiYDwnCDQLdTBbxvIWWyqdMzSMQF+s9wiV4dUZP/UQ6VlG0edXdHHAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749262277; c=relaxed/simple;
	bh=gj7j6iCbP1zz9ciAf1OUSTxm4Jh7pVQ0jVBSr5+Gg9Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C3hg5403SJN20Aag76uWc2rqnSAhbKem0WQ8XQX7reE/H2qILPFUGiMl9wnniJlxG2cnAggD6RvuboBVCPhEfgTZmhcMLriGqndkFf+4JC871iR7m30v3aQl5sJ9p4SFq+o408GevrXmOnGx6BXbHaFjpiZ4tk6+dUzuUSOuvnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ui/US5kA; arc=fail smtp.client-ip=40.107.102.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ui/US5kA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k73U3qGMj+6SesNep1pFrNVnIXzioPeRkY+Fp9jmS0yTz+f5Pm5BaUO5Ave71KWx9Cpv+XEku7g4mVIICV6teJLWD8V5TljYAvGfUmmi8qWKl6vp1KwBNyl4PdpJKxsGDgWeBculsaapED+ZugaLCHn2ar+0Ltm0yI7p4LD9QejAQ6bSk03AvH3qN91/4q/YjnyWc0vT9SQU2ipYC5XBi1uN7zm7QObe9Dw8zA5nei4FLXGYk4Gw9SjeKJ6a+4MXDIokzHzMi4FJGTDn8enZFl27PpkUSbauGLFd5kg+ZjKqGSDwaBx98DpERkicUOEgo++fEa+DnX2mjZ7Lg+iooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1BPqHhX4uQ2mq0ll1h1njU1fwX27MLVQ+sUg3CLehY=;
 b=hj5cwa2a9foTvhmjRxHb1I74p3YwhMucvtYnYudcH5GJv8cJRCWuxgCyBKwMjKJ9cYFAYAYcaHlw381CSjLnw+9YgOBGVFB1uwHJcR7zntJaA/iReQRd/b7MbI8HQoDtS9ezB8VSLQTfesO5nMFTTjX/W5A0xAZtAaAJTToI91fnR65Ls2npkj/HmTK+Pbya4xMtZYG6dZWv/Qu8dPOtqnvHd8NKsv0Nvpy2XKX6y633vCIBzTAHUNnLgFb5GMs5E1IjOv0Rh3nl12khD1UrCnfy2W+yJ4mM+YNI7J95cINLnOrP+XTC3kNdswp6xQxA6VCUSutf9Kv+YLTLS4U/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1BPqHhX4uQ2mq0ll1h1njU1fwX27MLVQ+sUg3CLehY=;
 b=Ui/US5kAdYTEAItXK8+QXw0Emhohz5nxkuOUxRvwT9mZRT0CgXlPO5AcXmfPCGMmT2GFge/TAL5YqJkEWS0gJyux1uDHIslv+hRGIo/JicDtDBmJ5JrToLHf7omPlOaTvQQ9eaWTfAsjmM6XZivPYNoRoVxVtp/bCSvP3uI3/c5FrzIwssizkvPg0S8Vj+uHCkkR6vBmH7XfkTGqRW7ow+ZTAL7VXm7hn+bCqoMdsA4d4dCSpf8dWlefalDSTZu1s/3sLANQTBVbQ9y7xT3QYa8QFKiaI98f/iM+iIfkLRXFFzzy+kawvoZ4JcS9NePoCaANeJQKvYyw5VGfDV8ezQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SJ2PR12MB8157.namprd12.prod.outlook.com (2603:10b6:a03:4fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Sat, 7 Jun
 2025 02:11:09 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%5]) with mapi id 15.20.8792.033; Sat, 7 Jun 2025
 02:11:09 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v2] virtio: introduce SUSPEND and RESUME feature
Thread-Topic: [PATCH v2] virtio: introduce SUSPEND and RESUME feature
Thread-Index: AQHb0HMnlr49j8ZC+U6fxbFjtRzqQbP1psYwgABUcICAAQF1sA==
Date: Sat, 7 Jun 2025 02:11:09 +0000
Message-ID:
 <CY8PR12MB71950056CD7393AADA44EFCBDC69A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250529082355.86884-1-lingshan.zhu@amd.com>
 <CY8PR12MB7195A87D14C87D52B8A03C79DC6EA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <45bd7572-9672-49ad-b09e-f57ed6d5480b@amd.com>
In-Reply-To: <45bd7572-9672-49ad-b09e-f57ed6d5480b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SJ2PR12MB8157:EE_
x-ms-office365-filtering-correlation-id: 2a7bafb6-8242-40c3-5425-08dda568919e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Dl0r/Pl0WhBjTC42HYkSKNOL5Fm/uk+l7Xzr8sFGHtdfRdAGXUCTAd48NVD8?=
 =?us-ascii?Q?HLoc69JOImyH+8myfUM+pKwdbCqxVJK93zHfSoLcyNzvSS/t5nDNpL7wPHM+?=
 =?us-ascii?Q?RJE86S+zRK0xIcWudw0lL9PCPL0/7g3Y/BctdnQraOv9f3syYn2892nq+vZN?=
 =?us-ascii?Q?S6bVP93nUmrpU1sqXMYiQDThlEWIu0edqxkTXeBqhFH57AUYiuuTAH2VD29K?=
 =?us-ascii?Q?2u84e5S1Y1kSiNE6NcQvQ3h8LbdNJYeQNy8L8l8do0MmNwy5yTW3qp2fYV1B?=
 =?us-ascii?Q?o3pUYzci03PklDRm8QutwKi6Ji2BFnW+cTCWg2p0Wkoy/kUD5yhgoz2Xgn3p?=
 =?us-ascii?Q?N55zLmD/t+vDVvqxhBbSHRiPPmkew23o71ce9c7oss6dbFgJWnhzD8+ZnXxZ?=
 =?us-ascii?Q?ixwtZZ9v2gzc3op5CV2K62f4wb9PYDZw/AjKEvtyA6Wz14N5onkmnukOJGn0?=
 =?us-ascii?Q?4RrF7A2FRCaHkqOJpxKRT/HMOdqVMweh/mlkk4lpOWzc3te0U6/xJJ6OSWaM?=
 =?us-ascii?Q?enzzoSTbeql3wSxXiI9GYE3gA0CCPwzyiCMtky2T7m5oqQm59ltapLT+6GdX?=
 =?us-ascii?Q?c6/ybcnrBdaasvy4MP0eFTGW3ZYFiHP4PvYi0MWHdJ7rRnAEpmdAlilWqICJ?=
 =?us-ascii?Q?L3gz4TBIAtWl6NMe+J5uIfBCKJPK8/B/6Trcqax4uosHIBPd9LGAiNlxqeIL?=
 =?us-ascii?Q?8XthCL3cvFoX4vO2wAQMI5RFb6IPba5JcmhqGqbak66Qo55cXzTE1fHVrBDs?=
 =?us-ascii?Q?bDI5+vIkqUKqcfBLF4XKIf8nj4tq5hf/XAtVBKYrvaPSlBs9GFN3E3JajSHY?=
 =?us-ascii?Q?eSJebCrFEMgx9TGItHEi6icHB3Qga6W2kSsPPo2msREpSi4zL3gMEK8GiqS0?=
 =?us-ascii?Q?EL8OG6e1Zw1fd6khVX/hJnjErT3Zn665jtsLAS3ZZSBM5aJiKOR6gGENk+97?=
 =?us-ascii?Q?74cA+pIOr5UUW1XiM0FMvQqf6prp6siWp3RORtAzoxPYe3Zw1v03Z+3H46DD?=
 =?us-ascii?Q?tbumBWtRcFqqaO03a6SzXB6ob0hYjqO2aVMv93Iu1qyJdi5aFLl2Q7CxCpBc?=
 =?us-ascii?Q?BYAfom1KCEo8KKGN5mWD1MT25fvnbZsDOEDHCyN+l0X/vDDeIFuVQzEcJMBh?=
 =?us-ascii?Q?eMIFeSiEeTDji7BMvctPMCqkMOb74BAj4UGVhDhlJ+ilZ1Kq0SoNR7ea0lu0?=
 =?us-ascii?Q?0cdu+S/9ngDgKMN3iYn/IGB9VoDf8X/rs0CwDB+cIZ22w/bC4LnmM3OqeRQW?=
 =?us-ascii?Q?4ktDMzKAu+x8h5Ze+NfmGKXcLlysjLz1xugqVze3CflbyXIIo/DSiP6TvLg6?=
 =?us-ascii?Q?Wlm364kOl7+Rimtyt46qGkpm/m0OCZG09uNjU7l8XphIDj0cbnj/UxbvMhPN?=
 =?us-ascii?Q?VXo/lyAEIWWfOWWZEDiNpHgcOSmcAbUh1pBiVkHK+5wPGB9ixqDMbY7PaQdz?=
 =?us-ascii?Q?hl3trtCH6hOKZbJRIh8bZaVLWozOp6EsNoa5O8YOIAfiryIlt6OTgJkk42hP?=
 =?us-ascii?Q?VPDp9QwqXFpx1nc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QlEu8Mhm8v8lm7KDQo5MGEvVBsEdRzACR+cCJSAmADfGAsrRojRoMqpsdCtW?=
 =?us-ascii?Q?K6Pc79yX6j5eeLs+/kmeTL8xW0Y51HkxKkLZ1FmCuPhBJJOjoEKtBpwef+bU?=
 =?us-ascii?Q?lGiRonCKMpq9+DwEIqs7r8DuQk9a1R1Gcff4iocfmB8UhcBQ3yKyjHE0ixmB?=
 =?us-ascii?Q?Gwv0UBOVkDoERPT3jwQWeUBNiatsX33H0I2e5ykxUfBu6a45MuRVpiB+8TNU?=
 =?us-ascii?Q?VZ5/HVJXHZb0U11sjV3FCBbhGyKYsmnMcOPItISwF6t0gMMzu9GJiWU/3qxs?=
 =?us-ascii?Q?eXNoaTsTy3lTpWsGBMlBw0NROu7bLz/j55c1wNxaIHl9gM8mNAAgWG9GsNlE?=
 =?us-ascii?Q?BrZqj8CaDoEL9Vyj+bLHwCypzehi8f+gj2bJqXYWbtX1nlbS7fZE8QafkxOS?=
 =?us-ascii?Q?gzRH4vvq1xQ/e1egKCMmZuLH7ZkkjwgYDPfL8mCWTw0P5+HH09eJVu6Z6pPf?=
 =?us-ascii?Q?tGR9sov0hQiO+N34nuN7UnoMeicg4hauvpYsSeU+reOVVs1fiibMtJGLxB+l?=
 =?us-ascii?Q?2ims3KRQtcTiMKWtrcJ0usQgp0jN82DJgULT9tRUy8tp2+GJK81JQkwAgC+P?=
 =?us-ascii?Q?kdDL8Q6Bvhx0Ws1Y+7GHmygQKj6rNy4ABpG4oGwWzxh6iRMuDDaGnRQU4+NK?=
 =?us-ascii?Q?BLTz99eBoQ2gXhP0JeBBFAObfkF3qLpjQxW/C3X4AqCuMZSQxrJCeJhczaPR?=
 =?us-ascii?Q?CFXZkKYvYyzbcT/LzPYPEsq3rnVMG1E1FO04/RkHLE6x5tKMvd7ToISZJSG0?=
 =?us-ascii?Q?NBLWACMNmb1P01E4y160HpWS8hPprVygIESnbNfPQMt+V3aF6+iowGkgK+/4?=
 =?us-ascii?Q?ML+/lmFqOWBGLwOt40sfOFWlQh6N/DSOvH8L87z8Mpucn4McCuOUsomkRpFm?=
 =?us-ascii?Q?u7TT+G90ExqZWZeaSwkOPDFzw6fG/jbQ/df4kBu+1fEgB7TNz/9yjzdfGGFs?=
 =?us-ascii?Q?b1lHWDTQ9pOxg35sTO6YKmbilBKou1PsorVeL94mciXcC0ucZARAPPnl6n9M?=
 =?us-ascii?Q?N9SJDrkuleb4jUizce/e5RcH7bnITqKd/zK8yTlBScfSpTymfB5fxGNrNY9L?=
 =?us-ascii?Q?/cvRPQnyuQSQlNiuWM7FOFiBrO4ntFXJoVzdK8/3jT6gysTgvtxb4u40YnQA?=
 =?us-ascii?Q?E2s1gXjhZKNJvhwITHnRfmca+07LjvUsEp3lXC1BPdW0jHn+D6xiY0dnc6Vu?=
 =?us-ascii?Q?K2Gbs/AjyKk0wUmQ2D4V2kL82ht1P13YQNymGOrP0+FQTQ3IcDf5+a1PoZEW?=
 =?us-ascii?Q?FaGuaJ6FUHXGE0Vabr9a/RyQTBBsOKGJwVVn6DtUCmZ9H9YKEmRRMphb/xC5?=
 =?us-ascii?Q?SqdtAbspwvt1Ff59v4TnBkfBoe5Qa+2yIei191eso+EWp93RlVOAxXE3wiXf?=
 =?us-ascii?Q?Z51ICUuaL6BVpgBAWvI/zud1daiAOhdhcsRzuf80CNRbHOMzBpMiLTo73beB?=
 =?us-ascii?Q?7xdjOez1+EnX4VKxXEu79hFWVwaV5EA7ntM+0YJVEWd27EKC9Bz9YBBXVtFX?=
 =?us-ascii?Q?NpKolymsVrO9oNDVEyJq6OkvNEhZJC5w3kagTWq9qgSczQcuwCkX7oxg/4Dk?=
 =?us-ascii?Q?CX0dP+P7Q5vpI+y1JFbnBQ8jO1d5LAmayu3G4yqZpo4ZjDP5R+mtS9I9Jrgb?=
 =?us-ascii?Q?wWUn9RgW9FSFJrGno4rmenU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7bafb6-8242-40c3-5425-08dda568919e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2025 02:11:09.4227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ofOb5cTMeWBXf2EOhyB4abaLX4JAaofSjZ1P9VzfHVB3G/reJxWc8UvZTbEv5gL23NZzZtJkvC4UWzf95xATGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8157



> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: Friday, June 6, 2025 4:01 PM
>=20
> On 6/6/2025 1:52 PM, Parav Pandit wrote:
> > Hi,
> >
> >> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Sent: Thursday, May 29, 2025 1:54 PM
> >>
> >> This commit allows the driver to suspend the device through a new
> >> device status bit SUSPEND and resume the device running by re-setting
> >> DRIVER_OK bit in device status.
> >>
> >> This commit re-orders the device status bits.
> >>
> > I overall like this proposal. Few small comments to fix more below.
> > It is lot cleaner as it eliminates the previous bit flipping complexiti=
es.
> >
> > Can you please add one or two line on a use case/motivation,
> >
> > For example,
> >
> > Presently when an OS is suspended, the driver must fully stop and reset=
 the
> device, and on resume the driver must re-initialize the device.
> > This can be time consuming task to recreate large number of VQs.
> >
> > Instead, extend the specification to allow drivers to suspend and resum=
e
> the device, without recreating all the resources.
> > ...
>=20
> Hello Parav
>=20
> Here I think the spec provides mechanisms, not a policy. The user may
> employ this feature for other tasks other than live migration which requi=
res
> OS suspending.
>
Its not about some policy.
Sure user may use the feature in N different use cases.

The intent is very simple. For the reviewers to review the patch, why somet=
hing is needed should be presented.
So motivation/usecase/need is worth the entry.
Some reviewers do rely on the commit logs to understand the design intent b=
ehind it.

Without the need of the patch, I am not sure why would even one write and r=
eview the spec patch.
Please add known use cases. I am familiar with one that I suggested above.
=20
> >
> >
> >> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >> ---
> >>  content.tex | 74 ++++++++++++++++++++++++++++++++++++++++++++++-
> ----
> >> --
> >>  1 file changed, 65 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/content.tex b/content.tex index d3fc6a4..caef5d0 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -36,19 +36,22 @@ \section{\field{Device Status}
> >> Field}\label{sec:Basic Facilities of a Virtio Dev
> >>      this bit.  For example, under Linux, drivers can be loadable modu=
les.
> >>    \end{note}
> >>
> >> -\item[FAILED (128)] Indicates that something went wrong in the
> >> guest,
> >> -  and it has given up on the device. This could be an internal
> >> -  error, or the driver didn't like the device for some reason, or
> >> -  even a fatal error during device operation.
> >> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready
> >> +to
> >> +  drive the device.
> >> +
> >> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates
> >> +that the
> >> +  device has been suspended by the driver.
> >>
> >>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all
> the
> >>    features it understands, and feature negotiation is complete.
> >>
> >> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready
> >> to
> >> -  drive the device.
> >> -
> >>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has
> experienced
> >>    an error from which it can't recover.
> >> +
> >> +\item[FAILED (128)] Indicates that something went wrong in the
> >> +guest,
> >> +  and it has given up on the device. This could be an internal
> >> +  error, or the driver didn't like the device for some reason, or
> >> +  even a fatal error during device operation.
> >>  \end{description}
> >>
> > A new bit SUSPEND introduction should be done at the end without re-
> organizing rest of the bits.
> > Please add at the end.
> >
> > Is the intention to rearrange the fields in ascending order of the bit
> number?
> > If yes, its good change too but than it missed re-arranging FEATURE_OK.
>=20
> oh yes, good catch, will fix
>=20
> >
> > If you want to re-arrange, please have the pre-patch in this series.
> >
> > Either way is ok to me,
> > 1. Either as pre-patch for re-arrangement + addition of SUSPEND in midd=
le.
> > Or
> > 2. adding SUSPEND bit definition at the end
> >
> > #1 is better to see in ascending order.
> I was required to re-arrange these status bits, but this is a trivial cha=
nge, so
> lets keep them in a single patch for easier review
Having logically separate patches are always good. Re-arrangement is pure c=
osmetic vs this one that adds new functionality.

> >
> >>  The \field{device status} field starts out as 0, and is
> >> reinitialized to 0 by @@ -
> >> 99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of
> >> a Virtio Device / Feature B  \begin{description}
> >>  \item[0 to 23, and 50 to 127] Feature bits for the specific device
> >> type
> >>
> >> -\item[24 to 41] Feature bits reserved for extensions to the queue
> >> and
> >> +\item[24 to 43] Feature bits reserved for extensions to the queue
> >> +and
> >>    feature negotiation mechanisms, see \ref{sec:Reserved Feature
> >> Bits}
> >>
> > Only one feature bit is used by this proposal.
> > So it should be 24 to 42 and use bit 42.
> >
> > Did you use bit 43 due to existence of VIRTIO_NET_F_GUEST_RSC6?
>=20
> Yes, bit 42 is taken for VIRTIO_NET_F_GUEST_RSC6.
So the current spec wordings  is incorrect 0 to 23, and 50 to 127 Feature b=
its for the specific device type

We need to says,

0 to 23, 41 to 42 and 50 to 127 Feature bits for the specific device type
This should also be pre-patch, so that it can be backported to master branc=
h.
Another reason for the small patch to be separate.

If you want me to write up this pre-patch, please let me know.
You can include in the series.

>=20
> >
> >> -\item[42 to 49, and 128 and above] Feature bits reserved for future
> >> extensions.
> >> +\item[44 to 49, and 128 and above] Feature bits reserved for future
> >> extensions.
> >>  \end{description}
> >>
> >>  \begin{note}
> >> @@ -629,6 +632,54 @@ \section{Device Cleanup}\label{sec:General
> >> Initialization And Device Operation /
> >>
> >>  Thus a driver MUST ensure a virtqueue isn't live (by device reset)
> >> before removing exposed buffers.
> >>
> >> +\section{Device Suspend}\label{sec:General Initialization And Device
> >> +Operation / Device Suspend}
> >> +
> >> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend
> >> +the
> >> device by setting the SUSPEND bit in \field{device status} to 1, and
> >> the device SHOULD set the DRIVER_OK bit to 0 once it has been
> suspended.
> >> +
> > This is not a normative section so please avoid using SHOULD.
> > Better to word it as informative theory of operation text.
> > Such as,
>=20
> why "SHOULD" can only be used in normative sections?
>=20
Because:

1. To clarify the intent:
These keywords carry precise semantic weight. When a spec says MUST, it mea=
ns compliance is not optional. Using such terms in general or explanatory t=
ext risks misinterpreting guidance as a requirement.

2. Avoiding Ambiguity:
If normative language is used in non-normative (informative) sections, it b=
ecomes unclear whether the reader is required to follow it or if it's just =
background or suggestion.

3. Informative sections explain context, rationale, or examples. Normative =
sections define rules. Mixing the two muddies the structure and weakens the=
 authority of the normative part.

> >
> > If X is not negotiated, the....
> > And the device sets the DRIVER_OK bit to 0 once it has been suspend.
> >
> >> +If the device has been suspended, the driver can resume the device
> >> +running
> >> by setting the DRIVER_OK bit in \field{device status} to 1, and the
> >> device should set the SUSPEND bit to 0 once it resumes running.
> >> +
> > The device sets the SUSPEND bit to 0 once the device is running.
>=20
> What is the difference in semantic?
>=20
"resumes running" does not read correct.
And normative "should" is used...
Hence the suggestion to re-word it.

> >> +\drivernormative{\subsection}{Device Suspend}{General Initialization
> >> +And Device Operation / Device Suspend}
> >> +
> >> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or
> >> VIRTIO_F_SUSPEND is not negotiated.
> >> +
> >> +Once the driver sets SUSPEND bit in \field{device status} to 1:
> >> +\begin{itemize}
> >> +\item The driver MUST verify whether the device has been suspended
> >> +by
> >> re-reading \field{device status}, examining whether the SUSPEND bit
> >> is set to
> >> 1 and the DRIVER_OK bit is set to 0.
> >> +\item The driver MUST NOT make any more buffers available to the
> device.
> >> +\item The driver MUST NOT send notifications for any virtqueues.
> >> +\item The driver MUST NOT make any changes to Device Configuration
> >> Space except for \field{device status} if it is part of the Configurat=
ion
> Space.
> >> +\end{itemize}
> >> +
> >> +\devicenormative{\subsection}{Device Suspend}{General Initialization
> >> +And Device Operation / Device Suspend}
> >> +
> >> +The device MUST ignore any operations on the SUSPEND bit from the
> >> +driver if the device has not been completely initialized by the
> >> +procedures in \ref{sec:General Initialization And Device Operation /
> >> +Device Initialization}
> >> +
> >> +The device SHOULD ignore any write access to its Configuration Space
> >> +while suspended, except for \field{device status} if it is part of
> >> +the
> >> Configuration Space.
> >> +
> >> +A device MUST NOT send any notifications for any virtqueues, access
> >> +any virtqueues, or modify any fields in its Configuration Space
> >> +while suspended.
> >> +
> >> +If changes occur in the Configuration Space during suspended period,
> >> +the device MUST NOT send any configuration change notifications.
> >> +Instead, the device MUST send the notification when it resumes runnin=
g.
> >> +
> >> +If the driver sets the SUSPEND bit in \field{device status} to 1,
> >> +the device MUST either suspend itself or set the DEVICE_NEEDS_RESET
> >> +bit in
> >> \field{device status} to 1 when it fails to suspend.
> >> +
> > Even though you have the driver normative, it is good to have device
> normative for suspend and resume operation:
> >
> > Something like,
> >
> > When the suspend operation completes in the device, the device MUST
> > set SUSPEND bit to 1 and DRIVERK_OK to 0.
> >
> > When the suspended device is resumed, the device MUST set SUSPEND bit
> to 0 and DRIVER_OK to 1.
>=20
> I think we already have similar descriptions in the beginning of this sec=
tion
>
I didn't find it in the normative device section.
=20
> >
> >
> >> +If the device has been suspended and the driver resumes the device
> >> +running by setting the DRIVER_OK bit in \field{device status} to 1,
> >> +the
> >> device MUST either resume normal operation or set the
> >> DEVICE_NEEDS_RESET bit in \field{device status} to 1 when it fails to
> resume.
> >> +
> >> +When the driver sets the SUSPEND bit to 1, the device SHOULD perform
> > It should be MUST.
> > Otherwise it can crash the system accessing memory that may not be any
> more accessible.
>=20
> Not sure how this can crash system memory, but "MUST" is OK
>=20
Ok.
> >
> >> +the following actions before presenting the SUSPEND bit as 1 and
> >> DRIVER_OK bit as 0 in the \field{device status}:
> >> +
> >> +\begin{itemize}
> >> +\item Stop consuming more buffers of any virtqueues.
> >> +\item Wait until all buffers that are being processed have been used.
> >> +\item Send used buffer notifications to the driver.
> >> +\end{itemize}
> >
> >> +
> >>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport
> >> Options}
> >>
> >>  Virtio can use various different buses, thus the standard is split
> >> @@ -872,6
> >> +923,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature
> >> Bits}
> >>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature
> >> Bits} for
> >>  	handling features reserved for future use.
> >>
> >> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver =
can
> >> +   suspend the device by set the SUSPEND bit to 1.
> >> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status F=
ield}.
> >> +
> >> +
> >>  \end{description}
> >>
> >>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
> >> Bits}
> >> --
> >> 2.49.0
> >>
> > Apart from these small comments, please add the line in v3 commit log:
> >
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
h
> > ub.com%2Foasis-tcs%2Fvirtio-
> spec%2Fissues%2F&data=3D05%7C02%7Cparav%40nv
> >
> idia.com%7C0ef2b01694d942339bb308dda4e5365c%7C43083d15727340c1b
> 7db39ef
> >
> d9ccc17a%7C0%7C0%7C638848026619639978%7CUnknown%7CTWFpbGZsb
> 3d8eyJFbXB0
> >
> eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpb
> CIsIl
> >
> dUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D0st2osYsAxascHHmHj0RgSyYAn9l
> yQRKqxOl
> > aIjE8dk%3D&reserved=3D0<issue_number>
> >
> > This will help to link the two sides.
>=20
> sure
>=20

Thanks.
