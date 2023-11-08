Return-Path: <virtio-comment-return-8261-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75980C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 09:00:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B9E702ACA5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 09:00:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 831CB986CA1
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 09:00:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 54E4C986C96; Wed,  8 Nov 2023 09:00:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 33826986C97
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 09:00:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPvyiYkI3/L0pAmOtz8tn36VMV4hg3mopXSb3Igg9L7kdtjKdSW7sl+AxxspUxneexWBwvw2jbNOTtl/giEWurAzPsqzloUAtSXhzeCofwBOxeY+KtIN+uQl12oebzGOI/ycfMWw7007mth2ufYOgpTcVSQuIu6YfUsIBSua+CWtIM6vo/LvZI4aKyH41iTzCCKEfNW5rlZMZV7g3vQ+BH4dxdDwaJpikY+SH9OXq9RdFgil3TpM/sSiAhh65uAR0XctWrch0DZOpTGOys+BLbUXbflQEbvAWqALWLp2UJ2eJweq/GK6EggeHltqt8GP7yeCtj/CD4yfAOZh3NNjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgcaDbHnd0rY/iPFP4CqYCF9/YVPj/BUrMHkTjd2ueE=;
 b=TrMVtgcVO+o8qnBGhs1t+JvLBaNjSoLQrZXe+GEj4HYIgSMjI7GwTZVjiPkvPVqvsq01e7qWTMg2ftWj9ABKHnPYtCerXOkaAit5t1JCUsdnvvuoudc9VhBhNA8hHl7FpHxAmHJTaQHx+FUThUvCpAP9oqgpUQr20JgCRKSyPx87FJj7a+zIxEptVz/KZAl/h3ZRbyfCP612+hxK7Ij4ViFzms0jn+5+/WV1SbenZT7evdhSZZiYS1TDh4L8T4xoEv1vUUBjewvWBWdVxcxqZso8nOiYt0j1lKRJXhNMu4Bp1XA/x0ftu8cBAamFgnJI4ezacSyt5Zwg36Q4R62xnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands
Thread-Index: AQHaEfwUGl0o9tnLPEOcv64rj4RwurBwFAEAgAAIryA=
Date: Wed, 8 Nov 2023 09:00:00 +0000
Message-ID:
 <PH0PR12MB54819D42D98DB9BB95800947DCA8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231108025854-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8510:EE_
x-ms-office365-filtering-correlation-id: 09877019-d4ca-4dbc-9744-08dbe03916a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XHTXPxpoqWKz1EgNhxpMUhJWsmhxdIEjzzbw2c1RaqvsXSOz3yjjo48u+xgCtLK8HH+tMro46O1xLGzCBbjASU8S7ApHpQV0BlO4j+LsFNQlFF+j4sF+D9sZ/rdhiZHMUu5XOaLFb9wMSTzhT2M7NiH1Q/pd2jlnMoR8xmbFyUUpmUvnM3wILaKiESennh/lGGWzKjfjHmwgeGeufYdmr/1p1Ti0VjRC7rsLfRCOnJxOT08J1c77OdwXP6+aTHxBsjWwMzWLJOzHAEzf3V/pVIrl+CpV32NZ+VT9z/M11tsWtbIfqI7nIc0lsIIISYYt5XS3cjsA3y0eEP6yfaPl4ONJrA0nd8YTGq+wYgCOtDWMukPtYrvh019U6qDpmDQUFitWCrqJfBFb97oqbI4GdnUuQDef8B8Oxrxg/u37yuIR/CmGPCTFu6XafJfV4y3bJbvRd6XnIDJg0ExvJW549d3L8Sx6Fj2Bs2fJbG8zUQU3Q1R2A6CwyVHO1FNAVPPriiM3juOH24UAD1lZdn03Q5nAFbH3XFka6Cccqq/CJOtn/43Ga0U8eWazqa8jPI8fJ4bputzYC2C6yExHbGQqO7oIEs7Qkl1d139xaoWdDk8INizK6HKCqpkG9JdjJqvR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(9686003)(6506007)(7696005)(71200400001)(478600001)(83380400001)(4744005)(2906002)(38070700009)(26005)(5660300002)(41300700001)(66946007)(66556008)(66446008)(64756008)(76116006)(54906003)(8676002)(110136005)(52536014)(316002)(4326008)(8936002)(33656002)(38100700002)(86362001)(122000001)(66476007)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0srRXVUQUNyRzE2YUwvNXpEbDhuMkpiV2FZdzFtY2ZoQnlRbGRkNnRJMVdj?=
 =?utf-8?B?bElNQXUxMmJDdGVvZmUyc3gvOGx5MlRnWXovN2NVNTQrcElHSnNLUGJxU2V4?=
 =?utf-8?B?Ri90SUo3SnR1OFczcGwxbEVvR1ZSdjdEYzJTc0JvSloxK0U4R2pvUEtTdWdH?=
 =?utf-8?B?REw5UGFuclZvdG9nMUFVZ1FYVjBnVzVKQkk0aThZdFo3bkpya3MvcFdlZ3BQ?=
 =?utf-8?B?M09XNXhtTDYxV29sMGJEcWhFQmhvR0JKeTl0SFdqUWVVZHZKSTMrc0d3ZWFl?=
 =?utf-8?B?VHg3bENka0cyWThwZDcxdzRDVGNvS1ZsM2p4YzdnRDdTd09Nby8vazNnKyt6?=
 =?utf-8?B?KzdWRC84ak56S3J5NVhWODhLSmdKb21tWUdZY0ZSQ2ZjM29ITWxCV3VoaGVO?=
 =?utf-8?B?V29yZndjL0tQVUpVZTNHdlJjNUxyaGRkeVJNNTBmNENsdnlOa3JZZTdRMjAv?=
 =?utf-8?B?R1lVVHVVd3Q1SG1lMkhzM1hkaTYwa2VFWExDL0VoblQ2Q2tIZm1FUjlEUjJw?=
 =?utf-8?B?RjFzT1k1L3d3bTZUcGJxakYwRWZyL0YvSW15RmRPdk9NenJESnVOWVlDUktL?=
 =?utf-8?B?SUc2bnZMNkV6aGs3YmxLbDdFNUpNcU14V2J2dXRXU1ZsVEJKNUNHVFRzMTVa?=
 =?utf-8?B?MkZVSlU2alkzczllYnQza09zSWFHR0xOTUlJUWpJN0xyQlJRbVFHQXRhc1la?=
 =?utf-8?B?S2lNTnRrRi90eTF2Z2VrRWl0MzhpSDBjNnpIcVBtdlkwcXVqTHdJbmdqaXE5?=
 =?utf-8?B?a3doMGFEUnBWVWVzbU5oUjdDdVQwY0ZkSDJwRDRQQ2MvREFNbmw5d21tUUNQ?=
 =?utf-8?B?eHZnei9OOUtzaWFYWGZxTFJESWdJbjd2TnhQVmxySVJJNitSclRPU2E1K0lG?=
 =?utf-8?B?NVlVTVJIYlpXNnJoVzl1QTVrU2plQ0lwWnVRUjk4QVNsMnMrci9JZ3pwUGV4?=
 =?utf-8?B?S0o3Y2R5bUFvMzhtTi9WZkx1NnVsNUZIS013bGE1bVZCRTdkcWhLWFdnU2Rk?=
 =?utf-8?B?N3czbHNSUThKdlhEYWVqQzFQa3RGd2VwTC9YZUkzVEtjdW56b2poeGQ3UnpF?=
 =?utf-8?B?N2pReVhOcUcvMnVMZUlyenpWSXowUTRVbzMxRnVBeVdLcG5qNzA3d3JJbDRD?=
 =?utf-8?B?c1FhTU11U0puSEdhN3VyZXhaLytUNi91L3BrRnNacDdxeDgxcXhJYzBMRXo5?=
 =?utf-8?B?d0JlOXBFcjdKNldqSGZxd2taZ3FRSlFaRTBKMmdSbWhtR2NlUUFaRUJvMEZu?=
 =?utf-8?B?ZE1ydS81Sy9NUWc2bS92VmczSmFYcEVlMEJEd3JBRlNUZUVzclBBTVZvTUZR?=
 =?utf-8?B?bXNvKzV5d0p6a1JkTTBvMTlpZEd0RjAyZUpnb1ZORjlBZ3VQbEJscE1xcjFU?=
 =?utf-8?B?M1Q4RU83a3VLdkNlc0I4T00xMFJralFDYVpwcmFtZ2c5U09wNi9FNlE0c3M5?=
 =?utf-8?B?Nm9JaEhjT3ZLN0tYMjdabG41b3J2alZkNkpJL0dYYThVZnJLNGhSenp5VHFG?=
 =?utf-8?B?RlJmeWFucjd5MHlhOTIxUW4wU3NOdVQzZE5LNENET0hrYitkQ2JDUGNHL2Zx?=
 =?utf-8?B?QnByZDJLUEdyeU5yK1AvRmdVem1zMm1selhZWEwycjY4ajFQcm1TOTM5TDFM?=
 =?utf-8?B?a2NBajg4dW54WnZFUG8yYmZuWkU3b2N5V2RFcjZiMXpUZnFjR0IwbEtHZEsv?=
 =?utf-8?B?RGh5b3UrUWRzUkpvNTUwT1ZhMkJ2VE1mVCt5S1NNN2hIWUZ6M1NhM3g4TzRP?=
 =?utf-8?B?VzRFZkNSbEhwVW9GRkRGNUVKcEF1czhTY3pqeDI2bXJDTEV3enBNc29oakI3?=
 =?utf-8?B?Ti9BeEVRMHpFbHZ6eUVIK1FWdGszV0tZNFRZc1hZUnFWcDlGNEN1dXNqYkt6?=
 =?utf-8?B?OERPYm9FUG5HVGhET1ZmRXRGUmNkQytYRjhqZVVwbjFBUnNRaVdKUC9ETDBP?=
 =?utf-8?B?QUJzYWF4ZmI5RGswU3QveTlTSkZLd3U1NFlYbzZ6eXpmZlYwM2FnbzNGdUdm?=
 =?utf-8?B?VlRkYWVqYjlURE5Tc0pOMlpPejlyTitvRlcrb2d1TWZYVXpiQzgwaU5aSnEx?=
 =?utf-8?B?WDV2Z2orck1FN0dGRHN0WlpTTG1hZTRzdFZSOHZhZzdUWEJ1dldDN3VEVU9r?=
 =?utf-8?Q?CMjg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09877019-d4ca-4dbc-9744-08dbe03916a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 09:00:00.0269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qa+tITvEbl9g8QSwETHn73kT00VooQ79gkaGvnBkHEq75UO1Z5zK3FYyzvGwO8uuZR6xbl5B5ZAL819Mq8seAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8510
Subject: [virtio-comment] RE: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands

PiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIE5vdmVtYmVyIDgsIDIwMjMgMTo0NyBQTQ0KDQo+IE9ubHkgZm9yIFRYLCBhbmQgSSdt
IHByZXR0eSBzdXJlIHRoZXkgaGFkIHRoZSBmb3Jlc2lnaHQgdG8gdGVzdCBSWCBub3QganVzdCBU
WCBidXQNCj4gbGV0J3MgY29uZmlybS4gUGFyYXYgZGlkIHlvdSB0ZXN0IGJvdGggZGlyZWN0aW9u
cz8NClJ4IGlzIHRoZSBtYWluIHBhcnQgdG8gdGVzdCBmb3IgdGhlIGRpcnR5IHBhZ2UgdHJhY2tp
bmcuDQpUeCBvbmx5IGlzIGFyb3VuZCByaW5nIHVwZGF0ZXMsIHNvIG5vdCB2ZXJ5IGludGVyZXN0
aW5nIHRlc3QuDQoNCldoZW4gcGFnZSB0cmFja2luZyBpcyBzdGFydGVkLCB0aGVyZSBpcyBpbXBh
Y3Qgb24gUnggYXMgbmF0dXJhbCB0aHJvdHRsZSBieSBzbG93aW5nIGRvd24gcnggcGFja2V0IHJh
dGUuDQpBbmQgZGV2aWNlcyBoYXZlIGltcGxlbWVudGF0aW9uIGNob2ljZSB0byBjb3ZlcmluZyB0
aGUgc3BlY3RydW0gb24gYW1vdW50IG9mIGRyb3AgcmF0ZS4NCkFuZCBoYXMgaW1wbGVtZW50YXRp
b25zIGV2b2x2ZSwgaXQgd2lsbCBpbXByb3ZlIGFzIHdlbGwuDQoNClBSSSBmb3Igc3VyZSBpcyBv
dXQgb2YgcXVlc3Rpb24uIE1vc3Qgd29ya2xvYWQgd29uJ3QgdXNlIGl0IGF0IGFsbCBnaXZlbiBv
dGhlciBsaW1pdGF0aW9ucyBvZiB2aXJ0aW8gb24gUENJIGZyb250IGFuZCBleGlzdGluZyBQUkkg
YmVoYXZpb3JzLg0KDQpUaGVyZSBpcyBhbHNvIGEgdGVzdCB3aXRoIHBsYXRmb3JtIElPTU1VIGRp
cnR5IHBhZ2UgdHJhY2tpbmcgZG9uZSBhcyB3ZWxsIGJ1dCBpdCBpcyB2ZXJ5IGVhcmx5IHN0YWdl
IHRvIGNvbW1lbnQgaW4gdGhpcyBmb3J1bS4NCg0K

