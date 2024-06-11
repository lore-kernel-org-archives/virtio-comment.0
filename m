Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A817625F
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718102233; cv=fail; b=L5KbCHqdN+ze16QdBqS8uYI5MVKkp+l8xZON6QZxJGOnR1n/mEYgCYvjrRnobWgaTDcbiL4GRQR2kASGo0LXO/6vJVI1gMDJdCpdB1Hx1QWH69dmRt4NdNxcayQVo2tbc77zOuh9FEiyZW8CI34NKEei270SkhKdjpkYswbXXto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718102233; c=relaxed/simple;
	bh=Y8sb/QSSZ5S6TNbO1g6j2p7eSrdrUiYcnXaOqxxJXSs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ce57gdrDtZb3GZooRcj6/4ldTWYMaBLzIdViJ8M8+R+r59QbMOCtBHDa/JHrCRUoG1NpHl5ewAoh/UmJJt2S4ncI0sIq+18pYgTno4FlnlbJqjW862Juk9QwkOIj1nxmbboSJ6JayKaE+9zsN7J20IUJgQEXSyBguktRsh4miYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kmuSqzGP; arc=fail smtp.client-ip=40.107.92.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kmuSqzGP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8XVEYbyEm8eaLTrlA2m3yvfvWxMdtnXW576YYC17wz0U+9foMsJwTz1PIYNyJHiWL+wGMI7phCBAg40e3lvQ0spek/fykYvh+X/vwscf16B9FxLlu4/qexSeOib3YUVDHG9A5I0NGtSONLcebbO8XEgLOqEbGp9U6z1QTKhyjUkd/MeDtAf5/NMWgMKwlw67EtPtV7dQUPyStfk+DV0XR+oRBiID+RSbqrr5Mycte5kWXgI2P53mm1eGGaL6RaKfBIcejTnsFkzix2obOn888ottHz5BN4odFlDYVQj8AUyM2SopEbdutABCKKBhmk2Uwrbk9M5FyeMB647BjL3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLGmR6wSWOr0RgEUJk+iaxbzc7EIzGvM4qEoXHpItXk=;
 b=ZEtBCVuhpLPxvjM+CPIDGxhc2N58WQCW+zlInaFD7MCo1VVLpqRFGhHsL8vzlVCH6cCkROGYtQX2zzbo9Iu+x99h+avGsFcQO40sE3wXx/hymNpupJcB1foWx6zN9wRQAnNuyHGH6JSI4AUaVPCDg20i7qC7093yGHR9hqrZ2tuoNZAoEazqPbTE0B1ivs+eF3snVijFEi+FlI0+8FDhf4lsCgCPXZpNCWQP9wh4r+Vsyp8RN5FIWzbY+Y8+2Cy1EhsVFhV/XL127HKi+KSBu++5npK+0tA+g4/ICfARAtL16wxWVB2LbJedfxDVkAqpYc7ZRNxW3M7lQsttzQ91Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLGmR6wSWOr0RgEUJk+iaxbzc7EIzGvM4qEoXHpItXk=;
 b=kmuSqzGPomNVPACYqRIeuCbMFH04L+CgpHI9RuH1UKva4qoMhQS9xZv3tSvu+npyaCRMbp7qyz2Wy/iJMftLdzEo7Z3ESHrvHJws6o3YXIzSOFrAMnFwOyYFKK0R1KuKXtAwFRHytM8ZnDNbXpzO58Sbb6rxOJceKU6GZKFV95VLJyB9HXkrRjuXfSjs42ln7qEcFkaRB4fmjhMWJZ10QkWB248PIRblmPsJN8dghYIJuhv/T5SEcKtiNx3VxDTSaUD4g++7j8JlygVn3gGcXbff55iJcN582jdtrHjnWRtNkCo6UWwGzCU870WJpKcPTwIYRGeKBZnTRZG2Lylnpw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 10:37:07 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 10:37:07 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, Cornelia Huck <cohuck@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	=?iso-8859-1?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>, David Stevens
	<stevensd@chromium.org>
Subject: RE: [PATCH v5] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH v5] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHauK5veGmfTEYzl0u4eTEkaSch67HBLmKAgADZnUCAADjDgIAABE1QgAAOSoCAAAA+cIAACrUAgAAEsSA=
Date: Tue, 11 Jun 2024 10:37:07 +0000
Message-ID:
 <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
 <87zfrskcmq.fsf@redhat.com>
 <PH0PR12MB548111206A0EEB7EE62421FADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com>
 <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com>
 <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com>
In-Reply-To: <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB8713:EE_
x-ms-office365-filtering-correlation-id: 9ca44dd8-b776-4d0d-6451-08dc8a027145
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?sr75dezp+y6t5YqKzvInQDgt9CUGYfVVVznBlilR5ALlh+9e5eMhrGiLSM?=
 =?iso-8859-1?Q?VfnjgeD6o+IfMVCRJ8uqmh6sqBtx6tLfNiqcI2Ji8xan3gFkqXFDNbBHmW?=
 =?iso-8859-1?Q?jLgnkp0Q1IOujkIJPfP+fiR8A/bjdyVP762qzQWc4Z8V2LOS3GZst3UGrb?=
 =?iso-8859-1?Q?LGvlJ5lrusjcx0HQ1nYRXWx9gsWDOyP96KvruDJ2AV/ck2CmfDq2URavFX?=
 =?iso-8859-1?Q?TNmOHq0mQCM5E3c6HpilisWBrdOssS70qNdf7Vj6SmGwjWSiMQmdWSRprK?=
 =?iso-8859-1?Q?xnqhwpw9zyB6iD/WCh4rkOWacIW37vNnCkQ5m0OJNnyuOKxdP26Ks6R8UP?=
 =?iso-8859-1?Q?fbxhLzqXcQ4SFJb+40BDt80lvWiYpZ1GRKR5v9soL/kGNrLAPvrQwuUtZb?=
 =?iso-8859-1?Q?19tNJixXDeU4f9FgNOs+bCF5HF7FsKbHz537YVRQOnA9Lfx2hLJK8a7W1p?=
 =?iso-8859-1?Q?k/nlDuzrugoU8vA7ahjKeyZftSTEWlxOw+GjFPD/lUe00wnMu/8xop5WbY?=
 =?iso-8859-1?Q?NHbJk+vqYL+gLHyRwH63Gv3EAyQDRm0yTQtnJi92isXLWsSnUDe1MeGcW0?=
 =?iso-8859-1?Q?Sqlgq94B6TUuDwqjE3VdykEc7nv9XhqOzicQw1Szw4EW5yAhmhYtytsS+d?=
 =?iso-8859-1?Q?NqM9uAGHNDCugRImn7OlQ7j0Lh7dVnGm7KuHy4iKTQ0XyYIhUAUUtb0UAo?=
 =?iso-8859-1?Q?0+LeK65So0zXTFHT80EImJ+eoTb99NL0f5qHwCob8cCGErNjuEEyjC8/Lo?=
 =?iso-8859-1?Q?Dbmgcj+a/z6r/Fwfs/3/cenH3GJYdUWVLDIiBmXyN/XU8Pq36kguSVx5Ub?=
 =?iso-8859-1?Q?yNTxD6AXXm9b3CxueJvtZrdoIzYNo4TLRiFxA2dYfUt0hI98PHN5BpGiez?=
 =?iso-8859-1?Q?lTBAxuvFIxj/3NceXYHmgPkBYmt4bOLJzubjQfOlEL5gmhjomn9BBJVtyJ?=
 =?iso-8859-1?Q?2oZNx5v8dfEx8ZmAetHMZaP8kt3oQC1jpKHqhiiIALnQkunNWJh0wiRN6l?=
 =?iso-8859-1?Q?r9jmq6MZBOqLUlZtDlDadBfOQQWRjskqEVefEUTEAAUNx5BzyhIXJQM6Au?=
 =?iso-8859-1?Q?SFvSEKWq3q8egplmRwjzIRN04WEi0r8S+8OW2uHoE5PqcFpHmVpXp0dgPf?=
 =?iso-8859-1?Q?wxKAOvlHt2MxoOqmj4Khb/k3lZGtROs03L0GbTpssjmAUG/iTOndMrkbdw?=
 =?iso-8859-1?Q?bseIPIoCTsA0W5K4nROytmR2ZBPWSw94LFDByGLcPbyQo+jmk8s/4aMHzH?=
 =?iso-8859-1?Q?+tsJotMocXK99ByjR033am3Jmgpa4jV9yyCc3wR98d2zbLe0kdXFlNxDT+?=
 =?iso-8859-1?Q?4dHizpQpDOlWQr4XKEA3kVyZonWp45hgSqzV9qadTgWkafaNmdtUFmlz+S?=
 =?iso-8859-1?Q?NqHwfY3yQqFiOK0yGhm/oz5BdT22dV8SM8dtKJR+iypdKEXeiBqjs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LnCq07igEg5sTtn/e/Wj800NzH8FYEDw+SKO62wiMoQx43KATLVXXQl4Xh?=
 =?iso-8859-1?Q?iBFeUYzA99Y/X4TgYtLXQi3M8Lx7N4h9B4frOZNm5YWhR338OI9+o8ASk3?=
 =?iso-8859-1?Q?/2j+oJSx6smiTSTXAdske02F7ElfdeDE/UF7u8rZVPWvVXdWjoGbOMsLwj?=
 =?iso-8859-1?Q?eifKWJkYYZZPrnPNp962+lpNnzBtTz84nvfdnkb2uQIX7wiDYxuv5WjFZw?=
 =?iso-8859-1?Q?PwisXja0RCJcd564pMKFrqoyzofIE8vz1gzCxvU+L3zZNPSjzdbyRcH15j?=
 =?iso-8859-1?Q?2XUEpX3s+zwqn+xfwpDVejI0ubbdiXQByXttBORwEPKZ6led+Bj1tKn7kI?=
 =?iso-8859-1?Q?F5ZbqvWn2SGL6j+UekSHK4q5jTBM64MsYSYOr3jt7N/tm6YRCJsavOSjVr?=
 =?iso-8859-1?Q?/t0DnkpopXlcYUTbHqeUqLiIslvZdHRh90n5/qsOK4uNgZsHCSsZ9BDltx?=
 =?iso-8859-1?Q?RJw633JnM54HCmeq9PCY0JzQg+w9jS7x10Gy3bftt/iJJKgnYUaxlA0imD?=
 =?iso-8859-1?Q?ePqc7O0XIKkUd56sa6Y3Iy/meGYPGSe3FPzl9d2jk06NPLCyHGq5Psc+e2?=
 =?iso-8859-1?Q?qhb9/LnGYR62DDep1EVAKwk440hfbhj4s+tOuSk97OqDt1vVTicTPz316s?=
 =?iso-8859-1?Q?YY90tT+hNR1+8m7v89KplY4Y2YEWEKtRg777esLBzwhEPSBtDXXkX61g6p?=
 =?iso-8859-1?Q?0cRn4wMEHGzt+AAiQSKTwg9NmASU+i1MwGXEsJGYxfE9cn+HZ3VrAX3pCk?=
 =?iso-8859-1?Q?bDMyRmL/QDPfyOOEttrG6yfrBWXrKxYmGdCXtR71gjRMNaAjQF2bcmHJwh?=
 =?iso-8859-1?Q?/unvse9vpYIcdmxslkV32t6jcO8mZ4RujwM22EGqmgnFvWuRwXyt3nBjdS?=
 =?iso-8859-1?Q?yV6Ci1mVQ6zwKhIsb31Qal1pCrceV4++tBKX6mh83Wc4lusVtC/YQsC6RK?=
 =?iso-8859-1?Q?PLkSJdIBaBC/qf4cceWEqd4tScN6u4S2Hlur6WQDsGlx5FdIel4GPR7Trs?=
 =?iso-8859-1?Q?e6NGC4jEvRxQ8kWXFKsTVeUQgY+IR9zVOeiGx8MNYrNkxcnzahDC3Hz7UJ?=
 =?iso-8859-1?Q?9pZu26aTlI1sO9I7YdOGg1xUumlpu0b9jV3CGWKu8c2d61cs2UaN/FIM0q?=
 =?iso-8859-1?Q?FPxlxj8mwERdIF30CNU/yoE7psUcW0rnfHvI2xZA3w04Pl0K1CMY4w1Wl2?=
 =?iso-8859-1?Q?rt6GO7ceOGg+NN7esyXVc9r6lb2ovDxeHm+gzJRhvFbdwNZP2qn/RWFY8d?=
 =?iso-8859-1?Q?WwhxjekqTZeXfmOuhA8xVhWuHxoGLsaLloNtGFYH6ZGj6MDvPig7MiKmUO?=
 =?iso-8859-1?Q?hFyHXtaflFaNWXI2shkiqW8js4rTnuCOs6c0Pk4Cfb6g2+CSQiwcEYEyQj?=
 =?iso-8859-1?Q?A66V+6CfdN+WpEfcJmXdkXBTUOROoT6vIcTrx5Ax5peJzajlX8wiJ2eNr0?=
 =?iso-8859-1?Q?HWYmn4H8G5oOUk8nk3MvtaDexXJUx0U7qNAQ2455+WzxiI2zpXpmA5LwTJ?=
 =?iso-8859-1?Q?9NU7IoRpPPBk9MoJdSZFgrJOajxwYlrK+6cnivY4VaczUPu91zxnrokSSn?=
 =?iso-8859-1?Q?gx84MMjEh21YEp9jL1q2h5Y+Dsk3uGtaL0Ks52MrIKQK90UXmadQLoElfD?=
 =?iso-8859-1?Q?VIjvawBCaLKbA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca44dd8-b776-4d0d-6451-08dc8a027145
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 10:37:07.4194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SdtVrKmp28VB7qOGV1n3x/r9Ab2yEx4e72dz7NAsca6o+avXeMUw7kndvkbfW+vQnp32Spo+/srgFnnrUEZTlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8713


> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: Tuesday, June 11, 2024 3:42 PM
>=20
> On 6/11/2024 5:43 PM, Parav Pandit wrote:
> >> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >> Sent: Tuesday, June 11, 2024 3:03 PM
> >>
> >> On 6/11/2024 4:48 PM, Parav Pandit wrote:
> >>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>> Sent: Tuesday, June 11, 2024 1:57 PM
> >>>>
> >>>> On 6/11/2024 1:17 PM, Parav Pandit wrote:
> >>>>> Hi Lingshan, David,
> >>>>>
> >>>>>> From: Cornelia Huck <cohuck@redhat.com>
> >>>>>> Sent: Monday, June 10, 2024 9:34 PM
> >>>>>>
> >>>>>> On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
> >>>>>>
> >>>>>>> This commit allows the driver to suspend the device by
> >>>>>>> introducing a new status bit SUSPEND in device_status.
> >>>>>>>
> >>>>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> >>>>>>> which indicating whether the device support SUSPEND.
> >>>>>>>
> >>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> >>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> >>>>>>> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> >>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
> >>>>>>> ---
> >>>>>>>  content.tex | 69
> >>>>>>> +++++++++++++++++++++++++++++++++++++++++++++--------
> >>>>>>>  1 file changed, 59 insertions(+), 10 deletions(-)
> >>>>>> Can you please add a changelog? Especially as some of the
> >>>>>> previous discussion has been lost due to the broken old mailing li=
sts...
> >>>>>>
> >>>>>> (...)
> >>>>>>
> >>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
> >>>>>>> +Initialization And Device Operation / Device Suspend}
> >>>>>>> +
> >>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
> >>>>>> VIRTIO_F_SUSPEND is not negotiated.
> >>>>>>> +
> >>>>>>> +Once the driver sets SUSPEND to \field{device status} of the dev=
ice:
> >>>>>>> +\begin{itemize}
> >>>>>>> +\item The driver MUST re-read \field{device status} to verify
> >>>>>>> +whether the
> >>>>>> SUSPEND bit is set.
> >>>>>>> +If not, the device does not support the SUSPEND feature.
> >>>>>> That sentence is a bit weird: I'd expect the device to not offer
> >>>>>> VIRTIO_F_SUSPEND in the first place in that case... could this
> >>>>>> rather happen if the device is not able to handle the request at
> >>>>>> a specific point in
> >>>> time?
> >>>>>>> +\item The driver MUST NOT make any more buffers available to
> >>>>>>> +the
> >>>> device.
> >>>>>>> +\item The driver MUST NOT access any fields of any virtqueues
> >>>>>>> +or notify
> >>>>>> any virtqueues.
> >>>>>>
> >>>>>> "send notifications for any virtqueues"?
> >>>>>>
> >>>>>>> +\item The driver MUST NOT access Device Configuration Space.
> >>>>>> ...except for the status field, if it is part of the config space?
> >>>>>>
> >>>>>>> +\end{itemize}
> >>>>>>> +
> >>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
> >>>>>>> +Initialization And Device Operation / Device Suspend}
> >>>>>>> +
> >>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
> >>>>>> VIRTIO_F_SUSPEND is not negotiated.
> >>>>>>> +
> >>>>>>> +The device MUST ignore all access to its Configuration Space
> >>>>>>> +while suspended, except for \field{device status}.
> >>>>>> ...if it is part of the configuration space.
> >>>>>>
> >>>>>>> +
> >>>>>>> +A device MUST NOT send any notifications, access any
> >>>>>>> +virtqueues, or modify any fields in its configuration space whil=
e
> suspended.
> >>>>>>> +
> >>>>>>> +If SUSPEND is set in \field{device status}, when the driver
> >>>>>>> +clears SUSPEND,
> >>>>>> "subsequently clears SUSPEND"?
> >>>>>>
> >>>>>>> +the device MUST either resume normal operation or set
> >>>>>> DEVICE_NEEDS_RESET.
> >>>>>>> +
> >>>>>>> +When the driver sets SUSPEND,
> >>>>>>> +the device SHOULD perform the following actions before
> >>>>>>> +presenting
> >>>>>> SUSPEND bit in the \field{device status}:
> >>>>>>> +
> >>>>>>> +\begin{itemize}
> >>>>>>> +\item Stop processing more buffers of any virtqueues \item Wait
> >>>>>>> +until all buffers that are being processed have been used.
> >>>>>>> +\item Send used buffer notifications to the driver.
> >>>>>>> +\end{itemize}
> >>>>>> So, is there any opportunity for the device to fail setting SUSPEN=
D?
> >>>>>> I mean, if the driver is supposed to look whether it sticks,
> >>>>>> there should be conditions for when the device might clear it agai=
n...
> >>>>>>
> >>>>> Additionally, a suspend operation usually involves saving things
> >>>>> to a slow
> >>>> memory (or media).
> >>>>> This is because the device implementation wouldn't know when
> >>>>> exactly the
> >>>> device will be resumed.
> >>>>> Few examples, are:
> >>>>> a. A gpu device with 128MB of video RAM when suspended, QEMU
> needs
> >>>> to store this into a (for example) rotating hard disk as 1msec IO la=
tency.
> >>>>> b. a NIC may need to store its RSS, queues, flow filters
> >>>>> configuration for
> >>>> several tens of KBs to some slow memory.
> >>>>> c. A block device may prefer to complete some IOs to a threshold
> >>>>> level
> >>>> instead of maintaining large list of outstanding IOs in some
> >>>> suspended memory.
> >>>>> d. May be more in future.
> >>>>>
> >>>>> Additionally, suspend operation needs to be synchronized with
> >>>>> certain data
> >>>> path hardware engines to suspend DMA operations (read and write
> >>>> both) which are inflight.
> >>>>> (without causing DMA errors). Same would apply to the sw backend
> >>>> implementations too.
> >>>>> Therefore, the suspend operation that is initiated by the driver,
> >>>>> should get
> >>>> the acknowledgement back from the device that it has been suspend.
> >>>>> Some of the good examples if you prefer to follow, a
> >>>>> driver<->device
> >>>> interface needs a suspend register which should behave like below
> >>>> queue reset register.
> >>>>> Spec snippet:
> >>>>> "The device MUST reset the queue when 1 is written to queue_reset.
> >>>>> The device MUST continue to present
> >>>>> 1 in queue_reset as long as the queue reset is ongoing. The device
> >>>>> MUST present 0 in both queue_reset and queue_enable when queue
> >>>>> reset
> >>>> has completed."
> >>>>> At minimum, we need, something implementable like,
> >>>>>
> >>>>> The device MUST suspend the device when 1 is written to the
> >>>> device_suspend_ctlr. The device MUST continue to present 1 in
> >>>> device_suspend_ctrl as the suspend operation is ongoing in the devic=
e.
> >>>>> The device MUST present 0 in the device_suspend_ctlr register when
> >>>> device has completely suspended the device.
> >>>>> The device MUST resume the device when 2 is written to the
> >>>> device_suspend_ctrl. The device MUST continue to present 2 in the
> >>>> device_suspend_ctrl as the resume operation may not have yet
> completed.
> >>>>> The device MUST present 0 in the device_suspend_ctrl register when
> >>>>> the
> >>>> device has completely resumed the device.
> >>>>> At this point, the driver may resume notifying the device and
> >>>>> accessing the
> >>>> configuration space.
> >>>>> Can you please enhance this part?
> >>>> Hi Parav
> >>>>
> >>>> Yes they are necessary contents and we will address them in the
> >>>> following patches.
> >>>>
> >>> The register polarity is critical.
> >>> In your reply to Cornelia, you descried that suspend bit cleared in
> >>> the device
> >> after driver sets it (until the device is suspended).
> >>> This is ambiguous behavior of the register. Queue_reset register was
> >>> like that
> >> before it was fixed in 1.2.
> >> once suspended, the driver should not access the configuration space
> >> except for the device status, so it should not reset any vqs through
> >> configuration space.
> > I am not talking about VQ reset at all.
> > I gave an example of how the VQ reset register polarity works (with was
> broken like how the proposed suspend bit is broken).
> >
> > Suspend register needs to work the way the reset register works.
> > Can you please go through my exact text I replied in the previous email=
?
> >
> > Basically, the bug is:
> > When driver has initiated the suspend (writing 1), the device continue =
to
> respond 0, while suspend is going on.
> >
> > At this point, just by looking at the device_status register one cannot=
 figure
> out what is going on in the device.
> > Is driver initiated suspend is ongoing, or it was never started.
> > It is ambiguous.
> From the device perspective, there is only one user: the driver, and the =
driver
> sets or clears SUSPEND, it knows the status of the device.
It does not work elegantly when the hypervisor or other system is looking d=
ealing with this register.

In current proposal, anyone else than the driver looking at the device_stat=
us, it is ambiguous.

For example,
suspend_bit: 0x1 suspended.
	     0x0 not suspended or suspend is ongoing. (ambiguous for hypervisor de=
bugging this device)

For device migration, it requires yet another side bit in the device parts.

An elegant and non-ambiguous interface can be,

ctrl_register =3D	0x0 (a usual default)
		0x1, suspend the device
		0x2, resume the device.
status_register =3D	0x0, (still) running.
			0x1, suspended.

With this driver and hypervisor (both) has very clear view of what is going=
 on and what is the status.
No more ambiguity for anyone.

Please consider pros and cons of both approaches.
